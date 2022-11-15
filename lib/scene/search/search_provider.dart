import 'package:demo_fx_project/model/search_result.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:flutter/foundation.dart';

class SearchProvider extends ChangeNotifier {
  final StockService _stockService;

  SearchProvider(this._stockService);

  List<SearchResult> searchResult = [];

  void queryKeyword(String keyword) async {
    if (keyword.isEmpty) {
      searchResult = [];
    } else {
      final result = await _stockService.search(keyword);
      searchResult = result;
    }
    notifyListeners();
  }
}
