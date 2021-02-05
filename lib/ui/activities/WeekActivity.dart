import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:marche_a_pied/i18n/AppLocalizations.dart';

import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/stream/StreamerCustom.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidget.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidgetData.dart';import 'package:marche_a_pied/widget/charts/WeekTimeSerieRender.dart';

class WeekActivity extends StatefulWidget {
  @override
  _WeekActivityState createState() => _WeekActivityState();
}

class _WeekActivityState extends State<WeekActivity> {
  DetailInheritedWidgetData inheritedWidgetData;
  List<Activity> activities;
  DateTime dateTime;
  DateTime dateTimeBegin;
  DateTime dateTimeEnd;

  DateFormat formatFinal = DateFormat(" MMMM y");
  DateFormat format = DateFormat("dd");
  DateFormat formatActivityList = DateFormat("EEEE dd MMMM y");

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  void changeDate(int add){
    setState(() {
      add == 1 ? dateTime = dateTime.add(Duration(days: 7)) : dateTime = dateTime.subtract(Duration(days: 7));
      inheritedWidgetData.sink.add(dateTime);
      inheritedWidgetData.dateTime = dateTime;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    inheritedWidgetData = DetailInheritedWidget.of(context).data;
    activities = inheritedWidgetData.listActivities;
    dateTime = inheritedWidgetData.dateTime;

    //recupérer le début de la semaine de la date fournie
    dateTimeBegin = getDate(dateTime.subtract(Duration(days: dateTime.weekday - 1)));
    //recupérer la fin de la semaine de la date fournie
    dateTimeEnd = getDate(dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday)));

    return SingleChildScrollView(
      child: StreamBuilder<List<Activity>>(
        stream: StreamerCustom(null).intervallDaysActivityStream(DateFormat("yyyy-MM-dd").format(dateTimeBegin), DateFormat("yyyy-MM-dd").format(dateTimeEnd), 1),
        builder: (context, snapshot) {
          final List<Activity> weekActivities = snapshot.hasData ? snapshot.data : activities;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Text("${format.format(dateTimeBegin)} - ${format.format(dateTimeEnd)} ${formatFinal.format(dateTimeEnd)}"),
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
              WeekTimeSerieRender(weekActivities),
              Divider(),
              ...weekActivities.map((act){
                return InkWell(
                  onTap: (){
                  },
                  child: ListTile(
                    title: Text(formatActivityList.format(act.dateActivity)),
                    subtitle: Text("${act.step} ${AppLocalizations.of(context).translate("steps")}"),
                  ),
                );
              }).toList(),
            ],
          );
        }
      ),
    );
  }
}
