import 'package:demo_fx_project/model/instrument.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:flutter/foundation.dart';


class DashboardProvider extends ChangeNotifier {
  final StockService _stockService;

  DashboardProvider(this._stockService);

  List<Instrument> watchList = [];

  void fetchInstrument(String symbol) async {
    final result = await _stockService.getTimeSeries(symbol);
    watchList = [
      Instrument(name: symbol, timeSeries: result)
    ];
    notifyListeners();
  }
}
