import 'package:demo_fx_project/model/candlestick.dart';
import 'package:demo_fx_project/model/instrument.dart';
import 'package:demo_fx_project/model/news_feed.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:flutter/foundation.dart';

class InstrumentScreenProvider extends ChangeNotifier {
  InstrumentScreenProvider(this._service, this.instrument);

  final StockService _service;
  List<Candlestick>? stockData;
  List<NewsFeed>? news;
  Instrument instrument;
  bool isFetchError = false;

  void fetchData(Instrument instrument) async {
    this.instrument = instrument;
    final timeSeriesData = await _service.getTimeSeries(instrument.name);
    final newsFeedsData = await _service.getNewsFeed(instrument.name);
    isFetchError = timeSeriesData == null || newsFeedsData == null;
    stockData = timeSeriesData;
    news = newsFeedsData;
    notifyListeners();
  }

  void refresh() async {
    fetchData(instrument);
  }
}