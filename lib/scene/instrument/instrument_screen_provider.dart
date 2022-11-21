import 'package:demo_fx_project/model/candlestick.dart';
import 'package:demo_fx_project/model/instrument.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:flutter/foundation.dart';

class InstrumentScreenProvider extends ChangeNotifier {
  InstrumentScreenProvider(this._service, this.instrument);

  final StockService _service;
  List<Candlestick>? stockData;
  Instrument instrument;
  bool isFetchError = false;

  void fetchData(Instrument instrument) async {
    this.instrument = instrument;
    final data = await _service.getTimeSeries(instrument.name);
    isFetchError = data == null;
    stockData = data;
    notifyListeners();
  }

  void refresh() async {
    fetchData(instrument);
  }
}