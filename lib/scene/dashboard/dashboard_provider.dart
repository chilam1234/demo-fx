import 'package:demo_fx_project/model/instrument.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:flutter/foundation.dart';

class DashboardProvider extends ChangeNotifier {
  final StockService _stockService;

  DashboardProvider(this._stockService);

  List<Instrument> watchList = [];

  void fetchInstruments(List<String> symbols) async {
    final batchRequest = symbols.map((symbol) => _stockService.getQuote(symbol));
    print('fetching instruments $symbols');

    final result = await Future.wait(batchRequest);

    if (result.length != symbols.length) {
      print('Response count do not match');
      return;
    }
    watchList = result;
    notifyListeners();
  }
}
