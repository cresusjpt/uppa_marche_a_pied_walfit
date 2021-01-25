import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;import 'package:marche_a_pied/widget/charts/WeekTimeSerieRender.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class WeekActivity extends StatefulWidget {
  @override
  _WeekActivityState createState() => _WeekActivityState();
}

class _WeekActivityState extends State<WeekActivity> {
  //DateFormat
  DateTime _currentDate = DateTime(2021, 1, 11);
  DateTime _currentDate2 = DateTime(2021, 1, 12);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2021, 1, 11));
  DateTime _targetDateTime = DateTime(2021, 1, 26);
  List<DateTime> _markedDate = [DateTime(2021, 1, 26), DateTime(2021, 1, 30)];
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
    /// Example with custom icon
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      thisMonthDayBorderColor: Colors.transparent,
      //selectedDayButtonColor: Color(0xFF30A9B2),
      //selectedDayBorderColor: Color(0xFF30A9B2),
      selectedDayTextStyle: TextStyle(color: Colors.yellow),
      weekendTextStyle: TextStyle(color: Colors.red,),
      //daysTextStyle: TextStyle(color: Colors.white),
      nextDaysTextStyle: TextStyle(color: Colors.transparent),
      prevDaysTextStyle: TextStyle(color: Colors.transparent),
      todayTextStyle: TextStyle(color: Colors.blue,),
      showWeekDays: true,
      //headerText: 'Janvier 2021',
      weekFormat: true,
      firstDayOfWeek: 1,
      isScrollable: true,
      showIconBehindDayText: false,
      daysHaveCircularBorder: null,

      /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      height: 180.0,
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

    List<String> itemList = List();
    itemList.add("Monday 14 december 2020");
    itemList.add("Tuesday, 15 December 2020");
    itemList.add("Wednesday, 16 December 2020");
    itemList.add("Thursday, 17 December 2020");
    itemList.add("Friday 18 December 2020");
    itemList.add("Saturday 19 December 2020");
    itemList.add("Sunday 20 December 2020");

    return SingleChildScrollView(
      child: Column(
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
                onPressed: () {},
                child: Icon(Icons.chevron_left_outlined),
              ),
              Text("11 - 17 January"),
              RawMaterialButton(
                shape: CircleBorder(),
                elevation: 0.0,
                onPressed: () {},
                child: Icon(Icons.chevron_right_outlined),
              ),
            ],
          ),
          WeekTimeSerieRender(),
          Divider(),
          ...itemList.map((item) {
            return InkWell(
              onTap: (){

              },
              child: ListTile(
                title: Text(item),
                subtitle: Text("8078 steps"),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

}
