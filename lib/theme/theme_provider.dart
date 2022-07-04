import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  /*     1.st appro
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme =>
      isLightTheme ? ThemeData.light() : ThemeData.dark();

      */

  ThemeProvider() {
    initialize();
  }
  List<String> themes = ["Light", "Dark", "System"];

  String currentTheme = "System";

  ThemeMode get themeMode {
    if (currentTheme == "Light") {
      return ThemeMode.light;
    } else if (currentTheme == "Dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  changeTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", theme);
    currentTheme = theme;
    notifyListeners();
  }

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    currentTheme = prefs.getString("theme") ?? "System";
    notifyListeners();
  }
}
