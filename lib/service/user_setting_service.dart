import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingService extends ChangeNotifier {
  static const keyWatchInstrument = "watch_instrument";
  List<String> watchingInstrument = [];

  void fetch() async {
    final pref = await SharedPreferences.getInstance();
    watchingInstrument = pref.getStringList(keyWatchInstrument) ?? [];
    notifyListeners();
  }

  void watchInstrument(String instrumentName) async {
    var watchingInstrument = List.of(this.watchingInstrument); // Use same reference will let _DashboardContentState think here is no change, so need copy a new reference
    if (watchingInstrument.contains(instrumentName)) {
      return;
    }

    watchingInstrument.add(instrumentName);
    final pref = await SharedPreferences.getInstance();
    pref.setStringList(keyWatchInstrument, watchingInstrument);

    this.watchingInstrument = List.unmodifiable(watchingInstrument);
    notifyListeners();
  }

  void unwatchInstrument(String instrumentName) async {
    var watchingInstrument = List.of(this.watchingInstrument);

    watchingInstrument.removeWhere((i) => i == instrumentName);
    final pref = await SharedPreferences.getInstance();
    pref.setStringList(keyWatchInstrument, watchingInstrument);

    this.watchingInstrument = List.unmodifiable(watchingInstrument);
    notifyListeners();
  }
}