import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const PrimaryColor = const Color(0xFF5F5F6A);
const PrimaryColorLight = const Color(0xFF4cb0af);
const PrimaryDarkColor = const Color(0xFF5F5F6A);
const PrimaryBlackColor = const Color(0xFF707070);

const SecondaryColor = const Color(0xFFE77834);
const SecondaryColorLight = const Color(0xFFB0CEE8);
const SecondaryColorDark = const Color(0xFF82ada9);

const ColorOrange = const Color(0xFFB0CEE8);
const ColorAccent = const Color(0xFFB0CEE8);
const WhiteColor = const Color(0xFFFFFFFF);
const BlackOverlay = const Color(0x66000000);
const BlackColor = const Color(0xFF000000);
const ErrorColor = const Color(0xFFFF5252);
const RedColor = Colors.red;
const TransparentColor = Colors.transparent;

const Background = const Color(0x66000000);
const GreyColor = const Color.fromRGBO(132, 133, 138, 1);

const TextColor = const Color(0xFFFFFFFF);

class AppTheme {
  static final ThemeData lightTheme = _buildLightTheme();
  static final ThemeData darkTheme = _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
        accentColor: ColorAccent,
        accentColorBrightness: Brightness.light,
        primaryColor: RedColor,
        primaryTextTheme: base.textTheme.copyWith(headline6: TextStyle(color: BlackColor,letterSpacing: 2)),
        textTheme: GoogleFonts.latoTextTheme(base.textTheme).copyWith(
            bodyText1:
                GoogleFonts.montserrat(textStyle: base.textTheme.bodyText1)),
        floatingActionButtonTheme: base.floatingActionButtonTheme
            .copyWith(backgroundColor: Colors.white),
        appBarTheme:
            base.appBarTheme.copyWith(
                elevation: 0, color: TransparentColor,
              iconTheme: IconThemeData(color: BlackColor),
            ));
  }

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
        textTheme: GoogleFonts.latoTextTheme(base.textTheme).copyWith(
            bodyText1:
                GoogleFonts.montserrat(textStyle: base.textTheme.bodyText1)),
        floatingActionButtonTheme:
            base.floatingActionButtonTheme.copyWith(backgroundColor: null));
  }
}
