import 'package:demo_fx_project/model/instrument.dart';
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
    var watchingInstrument = this.watchingInstrument;
    if (watchingInstrument.contains(instrumentName)) {
      return;
    }

    watchingInstrument.add(instrumentName);
    final pref = await SharedPreferences.getInstance();
    pref.setStringList(keyWatchInstrument, watchingInstrument);
    notifyListeners();
  }

  void unwatchInstrument(String instrumentName) async {
    var watchingInstrument = this.watchingInstrument;

    watchingInstrument.removeWhere((i) => i == instrumentName);
    final pref = await SharedPreferences.getInstance();
    pref.setStringList(keyWatchInstrument, watchingInstrument);
    notifyListeners();
  }
}