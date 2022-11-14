import 'package:demo_fx_project/model/candlestick.dart';
import 'package:demo_fx_project/model/search_result.dart';
import 'package:demo_fx_project/service/api_client.dart';

class StockService {
  static const String _apiKey = 'LUOH7PIRGSQ9BP3C';
  static const String _serviceRoot = 'https://www.alphavantage.co';
  final ApiClient _apiClient;

  StockService(this._apiClient);

  Future<List<Candlestick>> getTimeSeries(String symbol) async {
    final Map<String, dynamic> response = await _apiClient.get(
      '$_serviceRoot/query',
      queryParameters: {
        'function': 'TIME_SERIES_INTRADAY',
        'symbol': symbol,
        'interval': '5min',
        'apikey': _apiKey
      },
    );

    final timeSeriesKey =
        response.keys.firstWhere((k) => k.startsWith('Time Series'));
    return _parseResponse(response[timeSeriesKey]);
  }

  Future<List<SearchResult>> search(String keyword) async {
    final response = await _apiClient
        .get('$_serviceRoot/query', queryParameters: {'keywords': keyword});
    final result = response['bestMatches'] as List;
    return result.map((i) => SearchResult.fromJson(i)).toList();
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
    final result = jsonResponse.entries.map((entity) {
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
    });

    return result.toList();
  }
}
