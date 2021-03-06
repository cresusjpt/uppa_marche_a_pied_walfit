import 'package:flutter/material.dart';
import 'package:marche_a_pied/i18n/AppLanguage.dart';
import 'package:marche_a_pied/i18n/AppLocalizations.dart';
import 'package:marche_a_pied/styles/AppTheme.dart';
import 'package:marche_a_pied/ui/Licences.dart';
import 'package:marche_a_pied/ui/Principale.dart';
import 'package:marche_a_pied/ui/about/About.dart';
import 'package:marche_a_pied/ui/activities/DetailActivity.dart';
import 'package:marche_a_pied/ui/example/SparkChart.dart';
import 'package:marche_a_pied/ui/journal/DetailJournal.dart';
import 'package:marche_a_pied/ui/login/Intro.dart';
import 'package:marche_a_pied/ui/login/Login.dart';
import 'package:marche_a_pied/ui/login/Signup.dart';
import 'package:marche_a_pied/ui/settings/Settings.dart';
import 'package:page_transition/page_transition.dart';
import 'package:preferences/preference_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


//void main() => runApp(MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String _appTitle = "Marche à pieds";

  await PrefService.init(prefix: 'walkfit_');
  PrefService.setDefaultValues({
    'profile_steps': "6000",
    'profile_user_display_name': "John Doe",
    'profil_gender': "masculin",
    'profil_weight_value': "80",
    'profile_height_value': "187",
    'profile_birth_day': "26",
    'profile_birth_month': "01",
    'profile_birth_year': "1995"
  });

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
      case "/login":
        return PageTransition(
            settings: settings, child: Login(), type: PageTransitionType.fade);
        break;
      case "/register":
        return PageTransition(
            settings: settings, child: SignUp(), type: PageTransitionType.fade);
        break;
      case "/principal":
        return PageTransition(
            settings: settings,
            child: Principale(),
            type: PageTransitionType.fade);
        break;
      case "/detailjournal":
        return PageTransition(
            settings: settings,
            child: DetailJournal(),
            type: PageTransitionType.fade);
        break;
      case "/settings":
        return PageTransition(
            settings: settings,
            child: Settings(),
            type: PageTransitionType.fade);
        break;
      case "/about":
        return PageTransition(
            settings: settings,
            child: AboutScreen(),
            type: PageTransitionType.fade);
        break;
      case "/spark":
        return PageTransition(
            settings: settings,
            child: SparkBar.withSampleData(),
            type: PageTransitionType.fade);
        break;
      case "/detailactivity":
        return PageTransition(
            settings: settings,
            child: DetailActivity(),
            type: PageTransitionType.fade);
        break;
      case "/licences":
        return PageTransition(
            settings: settings,
            child: LicencesScreen(),
            type: PageTransitionType.fade);
        break;

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {

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
      initialRoute: "/intro",
      routes: {},
      onGenerateRoute: onGeneratedRoute,
    );
  }
}
