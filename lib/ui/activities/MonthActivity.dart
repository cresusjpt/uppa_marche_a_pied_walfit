import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/stream/StreamerCustom.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidget.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidgetData.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class MonthActivity extends StatefulWidget {
  @override
  _MonthActivityState createState() => _MonthActivityState();
}

class _MonthActivityState extends State<MonthActivity> {
  DateTime _currentDate;
  DateTime _currentDate2 = DateTime(2021, 1, 12);
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      OMIcons.directionsWalk,
      //Icons.person,
      color: Colors.amber,
    ),
  );

  DateFormat formatActivityList = DateFormat("EEEE dd MMMM y");

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2021, 1, 1): [
        new Event(
          date: new DateTime(2021, 1, 1),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2021, 1, 1),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2021, 1, 1),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  CalendarCarousel _calendarCarousel;

  DetailInheritedWidgetData inheritedWidgetData;
  List<Activity> activities;
  DateTime dateTime;
  DateFormat format = DateFormat("EEEE, d MMMM y");

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        DateTime(2021, 1, 25),
        Event(
          date: DateTime(2021, 1, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        DateTime(2021, 1, 1),
        Event(
          date: DateTime(2021, 1, 1),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(DateTime(2021, 1, 11), [
      Event(
        date: new DateTime(2021, 1, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      Event(
        date: new DateTime(2021, 1, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      Event(
        date: new DateTime(2021, 1, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    inheritedWidgetData = DetailInheritedWidget.of(context).data;
    activities = inheritedWidgetData.listActivities;
    dateTime = inheritedWidgetData.dateTime;
    _currentDate = dateTime;

    /// Example with custom icon
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      thisMonthDayBorderColor: Colors.transparent,
      selectedDayTextStyle: TextStyle(color: Colors.yellow),
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      nextDaysTextStyle: TextStyle(color: Colors.transparent),
      prevDaysTextStyle: TextStyle(color: Colors.transparent),
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      showWeekDays: true,
      weekFormat: false,
      firstDayOfWeek: 1,
      isScrollable: true,
      showIconBehindDayText: false,
      daysHaveCircularBorder: null,

      /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      height: 380.0,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,

      selectedDateTime: _currentDate2,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 30)),
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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: _calendarCarousel,
          ),
          Divider(),
          StreamBuilder<List<Activity>>(
              stream: StreamerCustom("http://10.0.2.2:8080")
                  .monthActivityStream("2021-01-01", "2021-01-31", 1),
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
                          subtitle: Text("${act.step} steps"),
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
