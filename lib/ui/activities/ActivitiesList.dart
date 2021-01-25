import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marche_a_pied/styles/AppTheme.dart';
import 'package:marche_a_pied/ui/example/SparkChart.dart';
import 'package:marche_a_pied/widget/CustomDailyGoals.dart';
import 'package:marche_a_pied/widget/CustomFloatingActionButton.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:marche_a_pied/widget/charts/DayTimeSerieRender.dart';

class ActivitiesList extends StatefulWidget {
  @override
  _ActivitiesListState createState() => _ActivitiesListState();
}

class _ActivitiesListState extends State<ActivitiesList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                          Navigator.pushNamed(context, '/detailactivity');
                        },
                        child: Stack(
                          overflow: Overflow.clip,
                          children: <Widget>[
                            Container(
                              height: 250,
                              width: 250,
                              child: CircularProgressIndicator(
                                strokeWidth: 6,
                                backgroundColor: Color(0xFFB0CEE8),
                                value: 0.2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFE77834)),
                              ),
                            ),
                            Container(
                              height: 250,
                              width: 250,
                              alignment: Alignment.center,
                              child: Text(
                                "2750 pas",
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
                                "754",
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
                                "0.11",
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
                                "14",
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
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    /*side: BorderSide(color: Colors.red)*/
                  ),
                  elevation: 2.3,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/spark");
                    },
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3.0),
                            child: Text("Your daily goals",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Last 8 days",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.chevron_right_outlined),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              "0/7\nAchieved",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "M", value: 0.5),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "T", value: 0.2),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "W", value: 0.1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "T", value: 1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child:
                                      CustomDailyGoals(day: "F", value: 0.09),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "S", value: 1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "S", value: 1),
                                ),
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
                            child: Text("Steps",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Last 7 days",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.chevron_right_outlined),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              "2645\nToday",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "M", value: 0.5),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "T", value: 0.2),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "W", value: 0.1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "T", value: 1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child:
                                      CustomDailyGoals(day: "F", value: 0.09),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "S", value: 1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: CustomDailyGoals(day: "S", value: 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                      title: Text("Heart rate"),
                      trailing: Icon(Icons.chevron_right_outlined),
                      subtitle: Text("No recent data"),
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
                      title: Text("Weight"),
                      trailing: Icon(Icons.chevron_right_outlined),
                      subtitle: Text("résumés des informations du capteur 3"),
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
                      title: Text("Données de quelques capteurs"),
                      trailing: Icon(Icons.chevron_right_outlined),
                      subtitle: Text("résumés des informations du capteur 4"),
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
                      title: Text("Données de quelques capteurs"),
                      trailing: Icon(Icons.chevron_right_outlined),
                      subtitle: Text("résumés des informations du capteur 5"),
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
