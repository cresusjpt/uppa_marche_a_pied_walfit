import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/stream/StreamerCustom.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidget.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidgetData.dart';
import 'package:marche_a_pied/widget/charts/DayTimeSerieRender.dart';

class DayActivity extends StatefulWidget {
  @override
  _DayActivityState createState() => _DayActivityState();
}

class _DayActivityState extends State<DayActivity> {
  DetailInheritedWidgetData inheritedWidgetData;
  List<Activity> activities;
  DateTime dateTime;
  DateFormat format = DateFormat("EEEE, d MMMM y");
  DateFormat formatBydate = DateFormat("yyyy-MM-dd");

  void changeDate(int add){
    setState(() {
      add == 1 ? dateTime = dateTime.add(Duration(days: 1)) : dateTime = dateTime.subtract(Duration(days: 1));
      inheritedWidgetData.sink.add(dateTime);
      inheritedWidgetData.dateTime = dateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    inheritedWidgetData = DetailInheritedWidget.of(context).data;
    activities = inheritedWidgetData.listActivities;
    dateTime = inheritedWidgetData.dateTime;

    return SingleChildScrollView(
      child: StreamBuilder<List<Activity>>(
        stream: StreamerCustom(null).byDateActivityStream(formatBydate.format(dateTime), 1),
        builder: (context, snapshot) {
          final List<Activity> daysActivities = snapshot.hasData ? snapshot.data : activities;
          return Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    shape: CircleBorder(),
                    elevation: 0.0,
                    onPressed: () {
                      changeDate(0);
                    },
                    child: Icon(Icons.chevron_left_outlined),
                  ),
                  Text(format.format(dateTime)),
                  RawMaterialButton(
                    shape: CircleBorder(),
                    elevation: 0.0,
                    onPressed: () {
                      changeDate(1);
                    },
                    child: Icon(Icons.chevron_right_outlined),
                  ),
                ],
              ),
              DayTimeSerieRender(daysActivities),
              Divider(),
              ...daysActivities.map((act){
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/detailjournal',arguments: act);
                  },
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${act.heureDebutRemote.split(".")[0]} - ${act.heureFinRemote.split(".")[0]}",style: TextStyle(fontSize: 11),),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0,bottom: 5.0),
                          child: Text("${act.applyName()}",style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    subtitle: Text("${act.distance} Km ${act.minuteActive} Min ${act.calorie} Cal"),
                  ),
                );
              }).toList(),
            ],
          );
        }
      ),
    );
  }

  @override
  void initState() {}
}
