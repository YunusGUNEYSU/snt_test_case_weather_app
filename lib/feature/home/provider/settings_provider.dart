import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/cache/constants.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isCelsius=true;
  bool get isCelsius => _isCelsius;
  Future<void> init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isCelsius = pref.getBool(CacheEnum.isCelsius.name)??false;
    notifyListeners();
  }

  Future<void> changeTempatureType(bool val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(CacheEnum.isCelsius.name, val);
    _isCelsius = pref.getBool(CacheEnum.isCelsius.name)??false;
    notifyListeners();
  }
}
