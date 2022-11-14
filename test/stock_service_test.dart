import 'dart:convert';
import 'dart:io';

import 'package:demo_fx_project/model/candlestick.dart';
import 'package:demo_fx_project/model/search_result.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_api_client.dart';

void main() {
  test('Stock service mapping', () async {
    var mockAPIClient = MockAPIClient();
    mockAPIClient.mockGetResult = (url, qs, header) async {
      final file = File('test/json/time_series_sample.json');
      final json = jsonDecode(await file.readAsString());
      return json;
    };

    final stockService = StockService(mockAPIClient);
    final response = await stockService.getTimeSeries('IBM');

    expect(response.sublist(0, 3), [
      Candlestick(
        time: DateTime(2022, 11, 11, 19, 20, 00),
        open: 143.24,
        high: 143.2400,
        low: 143.2400,
        close: 143.2400,
        volume: 106,
      ),
      Candlestick(
        time: DateTime(2022, 11, 11, 19, 10, 00),
        open: 143.2000,
        high: 143.2000,
        low: 143.2000,
        close: 143.2000,
        volume: 200,
      ),
      Candlestick(
        time: DateTime(2022, 11, 11, 18, 50, 00),
        open: 143.1,
        high: 143.1,
        low: 143.1,
        close: 143.1,
        volume: 146,
      ),
    ]);
  });

  test('Stock service bestMatches mapping', () async {
    var mockAPIClient = MockAPIClient();
    mockAPIClient.mockGetResult = (url, qs, header) async {
      final file = File('test/json/best_matches_sample.json');
      final json = jsonDecode(await file.readAsString());
      return json;
    };

    final stockService = StockService(mockAPIClient);
    final response = await stockService.search('tesco');

    expect(response.sublist(0, 3), [
      SearchResult(
        symbol: 'TSCO.LON',
        name: 'Tesco PLC',
        type: 'Equity',
        region: 'United Kingdom',
        marketOpen: '08:00',
        marketClose: '16:30',
        timezone: 'UTC+01',
        currency: 'GBX',
        matchScore: '0.7273',
      ),
      SearchResult(
        symbol: 'TSCDF',
        name: 'Tesco plc',
        type: 'Equity',
        region: 'United States',
        marketOpen: '09:30',
        marketClose: '16:00',
        timezone: 'UTC-04',
        currency: 'USD',
        matchScore: '0.7143'
      ),
      SearchResult(
        symbol: 'TSCDY',
        name: 'Tesco plc',
        type: 'Equity',
        region: 'United States',
        marketOpen: '09:30',
        marketClose: '16:00',
        timezone: 'UTC-04',
        currency: 'USD',
        matchScore: '0.7143',
      )
    ]);
  });
}
