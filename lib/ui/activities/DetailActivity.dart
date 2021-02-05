import 'package:flutter/material.dart';
import 'package:marche_a_pied/i18n/AppLocalizations.dart';
import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/ui/activities/DayActivity.dart';
import 'package:marche_a_pied/ui/activities/MonthActivity.dart';
import 'package:marche_a_pied/ui/activities/WeekActivity.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidget.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidgetData.dart';

class DetailActivity extends StatefulWidget {
  @override
  _DetailActivityState createState() => _DetailActivityState();
}

class _DetailActivityState extends State<DetailActivity> {
  List<Activity> activities;
  Map data = {};
  DetailInheritedWidgetData detailData;


  @override
  Widget build(BuildContext context) {
    if(data.isEmpty){
      activities = ModalRoute.of(context).settings.arguments;
      if(activities.length >0)
      detailData = DetailInheritedWidgetData(listActivities: activities,dateTime: activities.elementAt(0).dateActivity);
    }
    return !(activities == null || activities.isEmpty ) ?
    /*return*/ DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: AppLocalizations.of(context).translate("day"),
              ),Tab(
                text: AppLocalizations.of(context).translate("week"),
              ),
              Tab(
                text: AppLocalizations.of(context).translate("month"),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: DetailInheritedWidget(
            data: detailData,
            child: TabBarView(
              children: [
                DayActivity(),
                WeekActivity(),
                MonthActivity()
              ],
            ),
          ),
        ),
      ),
    ) :
    Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
