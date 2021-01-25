import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:marche_a_pied/i18n/AppLanguage.dart';
import 'package:marche_a_pied/i18n/AppLocalizations.dart';
import 'package:marche_a_pied/styles/AppTheme.dart';
import 'package:marche_a_pied/ui/Principale.dart';
import 'package:marche_a_pied/ui/about/About.dart';
import 'package:marche_a_pied/ui/activities/DayActivity.dart';
import 'package:marche_a_pied/ui/activities/DetailActivity.dart';
import 'package:marche_a_pied/ui/example/CarouselCalendar.dart';
import 'package:marche_a_pied/ui/example/CarouselExample.dart';
import 'package:marche_a_pied/ui/example/ContainerChartExamples.dart';
import 'package:marche_a_pied/ui/example/SparkChart.dart';
import 'package:marche_a_pied/ui/example/WithBarRenderer.dart';
import 'package:marche_a_pied/ui/journal/DetailJournal.dart';
import 'package:marche_a_pied/ui/login/Intro.dart';
import 'package:marche_a_pied/ui/settings/Settings.dart';
import 'package:page_transition/page_transition.dart';
import 'package:preferences/preference_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:charts_flutter/flutter.dart' as charts;

//void main() => runApp(MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String _appTitle = "Marche à pieds";

  await PrefService.init(prefix: 'pref_');

  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AppLanguage())],
    child: App(_appTitle, appLanguage),
  ));
}

class App extends StatefulWidget {
  String title;
  AppLanguage appLanguage;

  App(this.title, this.appLanguage);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/intro":
        return PageTransition(
            settings: settings, child: Intro(), type: PageTransitionType.fade);
        break;
      case "/principal":
        return PageTransition(
            settings: settings, child: Principale(), type: PageTransitionType.fade);
        break;
      case "/detailjournal":
        return PageTransition(
            settings: settings, child: DetailJournal(), type: PageTransitionType.fade);
        break;
      case "/settings":
        return PageTransition(
            settings: settings, child: Settings(), type: PageTransitionType.fade);
        break;
      case "/about":
        return PageTransition(
            settings: settings, child: AboutScreen(), type: PageTransitionType.fade);
        break;
      case "/spark":
        return PageTransition(
            settings: settings, child: SparkBar.withSampleData(), type: PageTransitionType.fade);
        break;
      case "/detailactivity":
        return PageTransition(
            settings: settings, child: DetailActivity(), type: PageTransitionType.fade);
        break;

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: widget.title,
      locale: widget.appLanguage.appLocal,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('fr', ''),
        Locale("en", "US"),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      initialRoute: "/principal",
      routes: {},
      onGenerateRoute: onGeneratedRoute,
    );
  }
}
