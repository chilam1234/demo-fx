import 'package:demo_fx_project/model/instrument.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:flutter/foundation.dart';

class DashboardProvider extends ChangeNotifier {
  final StockService _stockService;

  DashboardProvider(this._stockService);

  List<Instrument> watchList = [];

  Future<void> fetchInstruments(List<String>? symbols) async {
    if (symbols == null) {
      watchList = [];
      notifyListeners();
      return;
    } else {
      watchList = symbols.map((symbols) => Instrument(name: symbols)).toList();
      notifyListeners();
    }

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
