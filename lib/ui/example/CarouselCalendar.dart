import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class CalendarCarouselExample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          //take an action with date and its events
        },
        thisMonthDayBorderColor: Colors.transparent,
        selectedDayButtonColor: Color(0xFF30A9B2),
        selectedDayBorderColor: Color(0xFF30A9B2),
        selectedDayTextStyle: TextStyle(color: Colors.white),
        weekendTextStyle: TextStyle(color: Colors.white),
        daysTextStyle: TextStyle(color: Colors.white),
        nextDaysTextStyle: TextStyle(color: Colors.grey),
        prevDaysTextStyle: TextStyle(color: Colors.grey),
        weekdayTextStyle: TextStyle(color: Colors.green),
        weekDayMargin: EdgeInsets.zero,
        weekDayFormat: WeekdayFormat.standaloneShort,
        firstDayOfWeek: 1,
        showHeader: false,
        isScrollable: true,
        weekFormat: false,
        height: 280.0,
        selectedDateTime: DateTime(2021, 1, 9),
        daysHaveCircularBorder: true,
        customGridViewPhysics: NeverScrollableScrollPhysics(),
        markedDatesMap: _getCarouselMarkedDates(),
        markedDateWidget: Container(
          height: 3,
          width: 3,
          decoration: BoxDecoration(
            color: Color(0xFF30A9B2),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );
  }

  EventList<Event> _getCarouselMarkedDates() {
    return EventList<Event>(
      events: {
        DateTime(2021, 1, 3): [
          Event(
            date: DateTime(2021, 1, 3),
            title: 'Event 1',
          ),
        ],
        DateTime(2021, 1, 5): [
          Event(
            date: DateTime(2021, 1, 5),
            title: 'Event 1',
          ),
        ],
        DateTime(2021, 1, 22): [
          Event(
            date: new DateTime(2021, 1, 22),
            title: 'Event 1',
          ),
        ],
        DateTime(2021, 1, 24): [
          Event(
            date: DateTime(2021, 1, 24),
            title: 'Event 1',
          ),
        ],
        new DateTime(2021, 1, 26): [
          Event(
            date: DateTime(2021, 1, 26),
            title: 'Event 1',
          ),
        ],
      },
    );
  }

}