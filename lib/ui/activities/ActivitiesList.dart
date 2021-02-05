import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marche_a_pied/i18n/AppLocalizations.dart';
import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/stream/StreamerCustom.dart';
import 'package:marche_a_pied/styles/AppTheme.dart';
import 'package:marche_a_pied/widget/CustomDailyGoals.dart';
import 'package:marche_a_pied/widget/CustomFloatingActionButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivitiesList extends StatefulWidget {
  @override
  _ActivitiesListState createState() => _ActivitiesListState();
}

class _ActivitiesListState extends State<ActivitiesList> {
  SharedPreferences sharedPrefs;

  Future<SharedPreferences> _getPrefs() async {
    sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StreamBuilder(
                    stream: StreamerCustom(null).todayActivityStream(1),
                    builder: (context, snapshot) {
                      final List<Activity> activities = snapshot.data ?? List();
                      int step = 0;
                      int minuteActive = 0;
                      double calorie = 0;
                      double distance = 0;
                      activities.forEach((element) {
                        step += element.step;
                        calorie += element.calorie;
                        distance += element.distance;
                        minuteActive += element.minuteActive;
                      });
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 3,
                                child: RawMaterialButton(
                                  shape: CircleBorder(),
                                  elevation: 0.0,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/detailactivity',
                                        arguments: activities);
                                  },
                                  child: Stack(
                                    overflow: Overflow.clip,
                                    children: <Widget>[
                                      Container(
                                        height: 250,
                                        width: 250,
                                        child: FutureBuilder(
                                          future: _getPrefs(),
                                          builder: (context,
                                              AsyncSnapshot<SharedPreferences>
                                                  shp) {
                                            final int stt = shp.hasData
                                                ? int.parse(shp.data.getString(
                                                        "walkfit_profile_steps")) ??
                                                    6000
                                                : 6000;
                                            return CircularProgressIndicator(
                                              strokeWidth: 6,
                                              backgroundColor:
                                                  Color(0xFFB0CEE8),
                                              value: step / stt,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Color(0xFFE77834)),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        height: 250,
                                        width: 250,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "$step \npas",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xFFB0CEE8),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    shape: CircleBorder(),
                                    elevation: 0.0,
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Text(
                                          "$calorie",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: SecondaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "Cal",
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  RawMaterialButton(
                                    shape: CircleBorder(),
                                    elevation: 0.0,
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Text(
                                          "$distance",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: SecondaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "km",
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  RawMaterialButton(
                                    shape: CircleBorder(),
                                    elevation: 0.0,
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Text(
                                          "$minuteActive",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: SecondaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "Min",
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                StreamBuilder(
                  stream: StreamerCustom(null).pastWeekActivityStream(1),
                  builder: (context, snapshot) {
                    final List<Activity> activities = snapshot.data ?? List();
                    int average = 0;
                    activities.forEach((element) {
                      average += element.step;
                    });
                    average ~/= 7;
                    return Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            /*side: BorderSide(color: Colors.red)*/
                          ),
                          elevation: 2.3,
                          child: InkWell(
                            onTap: () {},
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3.0),
                                    child: Text(
                                        AppLocalizations.of(context)
                                            .translate("daily_goals"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate("last_seven_days"),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Icon(Icons.chevron_right_outlined),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: FutureBuilder(
                                      future: _getPrefs(),
                                      builder: (context, sharef) {
                                        int goals = 0;
                                        int achieveGoals = sharef.hasData
                                            ? int.parse(sharef.data.getString(
                                                    "walkfit_profile_steps")) ??
                                                6000
                                            : 6000;
                                        activities.forEach((element) {
                                          if (element.step >= achieveGoals) {
                                            goals += 1;
                                          }
                                        });
                                        return Text(
                                          "$goals/${activities.length}\n${AppLocalizations.of(context).translate("achieved")}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        );
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ...activities.map((activityElement) {
                                          String value = DateFormat("E")
                                              .format(
                                                  activityElement.dateActivity)
                                              .toUpperCase();
                                          value = "${value[0]}";
                                          return FutureBuilder(
                                            future: _getPrefs(),
                                            builder: (context, snSharedP) {
                                              final int dayStt = snSharedP
                                                      .hasData
                                                  ? int.parse(snSharedP.data
                                                          .getString(
                                                              "walkfit_profile_steps")) ??
                                                      6000
                                                  : 6000;
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 3.0),
                                                child: CustomDailyGoals(
                                                    day: value,
                                                    value:
                                                        activityElement.step /
                                                            dayStt),
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ), //Daily goals
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            /*side: BorderSide(color: Colors.red)*/
                          ),
                          elevation: 2.3,
                          child: InkWell(
                            onTap: () {},
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3.0),
                                    child: Text(AppLocalizations.of(context).translate("steps"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate("last_seven_days_num"),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Icon(Icons.chevron_right_outlined),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      "$average\n${AppLocalizations.of(context).translate("average")}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ...activities.map((e) {
                                          String value = DateFormat("E")
                                              .format(e.dateActivity)
                                              .toUpperCase();
                                          value = "${value[0]}";
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 3.0),
                                            child: CustomDailyGoals(
                                                day: value,
                                                value: e.step / average),
                                          );
                                        }).toList(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    /*side: BorderSide(color: Colors.red)*/
                  ),
                  elevation: 2.3,
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(AppLocalizations.of(context).translate("last_seven_days")),
                      trailing: Icon(Icons.chevron_right_outlined),
                      subtitle: Text(AppLocalizations.of(context).translate("no_recent_data")),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    /*side: BorderSide(color: Colors.red)*/
                  ),
                  elevation: 2.3,
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(AppLocalizations.of(context).translate("weigth")),
                      trailing: Icon(Icons.chevron_right_outlined),
                      subtitle: Text(AppLocalizations.of(context).translate("no_recent_data")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
