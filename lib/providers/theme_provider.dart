import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const THEME_STATUS = "THEME_STATUS";
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;

  ThemeProvider() {
    getTheme();
  }

  setDarkTheme(bool value) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool(THEME_STATUS, value);
    _darkTheme = value;
    notifyListeners();
  }

  Future<void> getTheme() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   _darkTheme = prefs.getBool(THEME_STATUS) ?? false;
   notifyListeners();
  }

}