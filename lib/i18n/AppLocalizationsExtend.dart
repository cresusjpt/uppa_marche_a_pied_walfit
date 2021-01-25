import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:marche_a_pied/i18n/AppLocalizations.dart';

class AppLocalizationsExtend extends AppLocalizations{
  AppLocalizationsExtend(Locale locale) : super(locale);

  static of(BuildContext context){
    return AppLocalizations.of(context);
  }
}