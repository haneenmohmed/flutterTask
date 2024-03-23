import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class themeProvider extends ChangeNotifier{

  ThemeMode theme=ThemeMode.light;
  Future<void> changeTheme(ThemeMode newTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(newTheme==theme)return;
    if(newTheme==ThemeMode.light){
      prefs.setBool("theme", true);
    }
    else {
      prefs.setBool("theme", false);
    }
    theme=newTheme;
    notifyListeners();
  }

  Future<void> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    theme=   (prefs.getBool("theme")==true?ThemeMode.light:ThemeMode.dark);
    notifyListeners();
  }

}