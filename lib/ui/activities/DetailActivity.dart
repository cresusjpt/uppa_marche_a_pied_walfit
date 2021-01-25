import 'package:flutter/material.dart';
import 'package:marche_a_pied/ui/activities/DayActivity.dart';
import 'package:marche_a_pied/ui/activities/MonthActivity.dart';
import 'package:marche_a_pied/ui/activities/WeekActivity.dart';
import 'package:marche_a_pied/utils/CalendarType.dart';

class DetailActivity extends StatefulWidget {
  @override
  _DetailActivityState createState() => _DetailActivityState();
}

class _DetailActivityState extends State<DetailActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Day",
              ),Tab(
                text: "Week",
              ),
              Tab(
                text: "Month",
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              DayActivity(),
              WeekActivity(),
              MonthActivity()
            ],
          ),
        ),
      ),
    );

    /*return SafeArea(
      child: Scaffold(
        appBar: AppBar(

        ),
        body: SizedBox(),
      ),
    );*/
  }
}
