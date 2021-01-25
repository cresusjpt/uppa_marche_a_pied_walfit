import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('fr');
  static Locale previous = Locale("fr");
  static bool streamBool = true;

  Locale get appLocal => _appLocale ?? Locale("fr");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('fr');
      prefs.setString("language_code", "fr");
      prefs.reload();
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    streamBool = false;
    return Null;
  }

  Stream<bool> streamLanguageChange() async*{
    StreamController<bool> rebuild = StreamController<bool>();

    var prefs = await SharedPreferences.getInstance();
    Locale actu = Locale(prefs.getString("language_code"));
    if(previous.languageCode != actu.languageCode){
      await fetchLocale();
      rebuild.add(true);
      yield true;
      print('JEANPAUL YIELD TRUE');
    }else{
      rebuild.add(false);
      yield false;
      print('JEANPAUL YIELD FALSE');
    }
  }

  Future<String> currentLanguage() async{
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString('language_code');
  }


  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      print("JEANPAUL object TEST ${prefs.getString("language_code")}");
      await fetchLocale();
      prefs = await SharedPreferences.getInstance();
      print("JEANPAUL object ${prefs.getString("language_code")}");
    }
    print("JEANPAUL object ${prefs.getString("language_code")}");
    previous = Locale(prefs.getString("language_code"));

    /*if (_appLocale == type) {
      return;
    }*/
    if (type == Locale("fr")) {
      _appLocale = Locale("fr");
      await prefs.setString('language_code', 'fr');
      await prefs.setString('countryCode', '');
      prefs.reload();
    } else {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
      prefs.reload();
    }
    streamLanguageChange();
    notifyListeners();
    streamBool = true;
  }
}