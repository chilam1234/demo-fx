import 'package:demo_fx_project/model/candlestick.dart';
import 'package:demo_fx_project/model/instrument.dart';
import 'package:demo_fx_project/model/news_feed.dart';
import 'package:demo_fx_project/model/search_result.dart';
import 'package:demo_fx_project/service/api_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StockService {
  static final String _apiKey = dotenv.get('VANTAGE_API_KEY', fallback: '');
  static final String _serviceRoot = dotenv.get('VANTAGE_URL', fallback: '');
  final ApiClient _apiClient;

  StockService(this._apiClient);

  Future<List<Candlestick>?> getTimeSeries(String symbol) async {
    final Map<String, dynamic> response = await _apiClient.get(
      '$_serviceRoot/query',
      queryParameters: {
        'function': 'TIME_SERIES_INTRADAY',
        'symbol': symbol,
        'interval': '60min',
        'apikey': _apiKey
      },
    );
    try {
      final timeSeriesKey =
          response.keys.firstWhere((k) => k.startsWith('Time Series'));
      return _parseResponse(response[timeSeriesKey]);
    } catch (error) {
      print(
          'Unable to get time series for $symbol: $error, rawResponse $response');
      return null;
    }
  }

  Future<Instrument> getQuote(String symbol) async {
    final Map<String, dynamic> response = await _apiClient.get(
      '$_serviceRoot/query',
      queryParameters: {
        'function': 'GLOBAL_QUOTE',
        'symbol': symbol,
        'apikey': _apiKey
      },
    );
    try {
      final data = response['Global Quote'];
      var priceChangeString = data['10. change percent'] as String;
      priceChangeString = priceChangeString.replaceAll('%', '');
      var priceChangePercent = num.tryParse(priceChangeString);
      return Instrument(
          name: data['01. symbol'],
          price: num.tryParse(data['08. previous close']),
          priceChange: priceChangePercent);
    } catch (error) {
      print(
          'Unable to get instrument for $symbol: $error, rawResponse $response');
      return Instrument(name: symbol, price: null, priceChange: null);
    }
  }

  Future<List<SearchResult>> search(String keyword) async {
    final response = await _apiClient.get(
      '$_serviceRoot/query',
      queryParameters: {
        'function': 'SYMBOL_SEARCH',
        'keywords': keyword,
        'apikey': _apiKey,
      },
    );
    try {
      final result = response['bestMatches'] as List;
      return result.map((i) => SearchResult.fromJson(i)).toList();
    } catch (error) {
      print('Unable to get search result: $error, rawResponse $response');
      return List.empty();
    }
  }

  Future<List<NewsFeed>?> getNewsFeed(String symbol) async {
    final response =
        await _apiClient.get('$_serviceRoot/query', queryParameters: {
      'function': 'NEWS_SENTIMENT',
      'tickers': symbol,
      'apikey': _apiKey,
    });

    try {
      final result = response['feed'] as List;
      return result.map((i) => NewsFeed.fromJson(i)).toList();
    } catch (error) {
      print('Unable to get news feed result: $error, rawResponse $response');
      return null;
    }
  }

  num _parseNumber(Map<String, dynamic> candlestickMap, String field) {
    final value = candlestickMap[field];
    if (value is String) {
      return num.tryParse(value) ?? -1;
    } else {
      return -1;
    }
  }

  List<Candlestick> _parseResponse(Map<String, dynamic> jsonResponse) {
    var result = jsonResponse.entries.map((entity) {
      final time = DateTime.parse(entity.key);

      final candlestickMap = entity.value;
      final open = _parseNumber(candlestickMap, '1. open');
      final high = _parseNumber(candlestickMap, '2. high');
      final low = _parseNumber(candlestickMap, '3. low');
      final close = _parseNumber(candlestickMap, '4. close');
      final volume = _parseNumber(candlestickMap, '5. volume');

      return Candlestick(
        time: time,
        open: open,
        high: high,
        low: low,
        close: close,
        volume: volume,
      );
    }).toList();

    result.sort((a, b) => a.time.compareTo(b.time));
    return result;
  }
}
