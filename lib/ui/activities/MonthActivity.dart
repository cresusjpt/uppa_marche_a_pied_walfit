import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:marche_a_pied/i18n/AppLocalizations.dart';
import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/stream/StreamerCustom.dart';
import 'package:marche_a_pied/styles/AppTheme.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidget.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidgetData.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class MonthActivity extends StatefulWidget {
  @override
  _MonthActivityState createState() => _MonthActivityState();
}

class _MonthActivityState extends State<MonthActivity> {
  DateTime _currentDate;
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      OMIcons.directionsWalk,
      color: Colors.amber,
    ),
  );

  DateFormat formatActivityList = DateFormat("EEEE dd MMMM y");

  Future<EventList<Event>> markDate(List<Activity> activities)async{
    EventList<Event> markedEventList = EventList();
    activities.forEach((activity) {
      activity.applyName();
      String title = "";
      title+="${AppLocalizations.of(context).translate("begin_hour")} :${activity.heureDebutRemote.split(".").elementAt(0)} \n";
      title+="${AppLocalizations.of(context).translate("end_hour")} :${activity.heureFinRemote.split(".").elementAt(0)} \n";
      title+="${AppLocalizations.of(context).translate("calorie")} :${activity.calorie} \n";
      title+="${AppLocalizations.of(context).translate("steps")} :${activity.step} \n";
      title+="${AppLocalizations.of(context).translate("minute")} :${activity.minuteActive} \n";
      Event event = Event(
        date: activity.dateActivity,
        title: title,
        icon: _eventIcon,
        dot: Container(
          margin: EdgeInsets.symmetric(horizontal: 1.0),
          color: SecondaryColorDark,
          height: 5.0,
          width: 5.0,
        )
      );
      markedEventList.add(activity.dateActivity, event);
    });

    await Future.delayed(Duration(milliseconds: 500));
    return markedEventList;
  }

  CalendarCarousel _calendarCarousel;

  DetailInheritedWidgetData inheritedWidgetData;
  List<Activity> activities;
  DateTime dateTime;
  DateFormat format = DateFormat("EEEE, d MMMM y");

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  void showAlertDialog(BuildContext context, String title, Event event) {

    // set up the button
    /*Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        return true;
      },
    );*/

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(event.title),
      /*actions: [
        okButton,
      ],*/
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String getMonthBegin(DateTime dt){
    DateFormat format = DateFormat("yyyy-MM-dd");
    DateTime beginDate = DateTime(dt.year,dt.month,01);

    return format.format(beginDate);
  }

  String getMonthEnd(DateTime dt){
    DateFormat format = DateFormat("yyyy-MM-dd");
    DateTime endate = DateTime(dt.year,dt.month+1,0);

    return format.format(endate);
  }

  Future<Widget> buildCalendarCarousel(List<Activity> activityList) async{
    final markedDate = await markDate(activityList);

    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        events.forEach((e) {
          if(e.date == date){
            String title = DateFormat("EEE, dd MMMM yyyy").format(e.date);
            showAlertDialog(context, title, e);
          }
        });
      },
      onCalendarChanged: (DateTime dt){
        setState(() {
          inheritedWidgetData.dateTime = dt;
        });
      },
      thisMonthDayBorderColor: Colors.transparent,
      selectedDayTextStyle: TextStyle(color: Colors.yellow),
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      nextDaysTextStyle: TextStyle(color: Colors.transparent),
      prevDaysTextStyle: TextStyle(color: Colors.transparent),
      showWeekDays: true,
      weekFormat: false,
      firstDayOfWeek: 1,
      isScrollable: true,
      showIconBehindDayText: true,
      daysHaveCircularBorder: null,

      /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      height: 380.0,
      markedDatesMap: markedDate,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,

      selectedDateTime: _currentDate,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: DateTime.now().add(Duration(days: 30)),
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.transparent,
      markedDateMoreShowTotal: true,
      // null for not showing hidden events indicator
      markedDateIconMargin: 9,
      markedDateIconOffset: 3,
      markedDateWidget: Container(
        height: 3,
        width: 3,
        decoration: BoxDecoration(
          color: Color(0xFF30A9B2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );

    return _calendarCarousel;
  }

  @override
  Widget build(BuildContext context) {
    inheritedWidgetData = DetailInheritedWidget.of(context).data;
    activities = inheritedWidgetData.listActivities;
    dateTime = inheritedWidgetData.dateTime;
    _currentDate = dateTime;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: StreamBuilder<List<Activity>>(
              stream: StreamerCustom(null).intervallDaysActivityStream(getMonthBegin(_currentDate), getMonthEnd(_currentDate), 1),
              builder: (context, snapshot) {
                List<Activity> actList = snapshot.hasData ? snapshot.data : activities;
                return FutureBuilder<Widget>(
                  future: buildCalendarCarousel(actList),
                  builder: (context, wshot){
                    if(wshot.hasData){
                      return wshot.data;
                    }else{
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                );
              }
            ),
          ),
          Divider(),
          StreamBuilder<List<Activity>>(
              stream: StreamerCustom(null)
                  .monthActivityStream(getMonthBegin(_currentDate), getMonthEnd(_currentDate), 1),
              builder: (context, snapshot) {
                final List<Activity> monthActivities =
                    snapshot.hasData ? snapshot.data : activities;
                return Column(
                  children: [
                    ...monthActivities.map((act) {
                      DateTime begin = getDate(act.dateActivity.subtract(
                          Duration(days: act.dateActivity.weekday - 1)));
                      DateTime end = getDate(act.dateActivity.add(Duration(
                          days: DateTime.daysPerWeek -
                              act.dateActivity.weekday)));
                      DateFormat dt = DateFormat("dd");
                      DateFormat dtFinal = DateFormat(" MMMM y");
                      return InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text(
                              "${dt.format(begin)} - ${dt.format(end)} ${dtFinal.format(end)}"),
                          subtitle: Text("${act.step} ${AppLocalizations.of(context).translate("steps")}"),
                        ),
                      );
                    }).toList(),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
