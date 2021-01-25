import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:marche_a_pied/ui/example/ContainerChartExamples.dart';
import 'package:marche_a_pied/ui/example/WithBarRenderer.dart';
import 'package:marche_a_pied/widget/charts/DayTimeSerieRender.dart';

class DayActivity extends StatefulWidget {
  @override
  _DayActivityState createState() => _DayActivityState();
}

class _DayActivityState extends State<DayActivity> {
  @override
  Widget build(BuildContext context) {
    List<String> itemList = List();
    itemList.add("28 December 2020 - 3 January 2021");
    itemList.add("21 - 27 December 2020");
    itemList.add("14 - 20 December 2020");
    itemList.add("07 - 13 December 2020");
    itemList.add("30 November - 6 December 2020");

    return SingleChildScrollView(
      child: Column(
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
              Text("Mardi le 12 Janvier 2021"),
              RawMaterialButton(
                shape: CircleBorder(),
                elevation: 0.0,
                onPressed: () {},
                child: Icon(Icons.chevron_right_outlined),
              ),
            ],
          ),
          DayTimeSerieRender(),
          Divider(),
          ...itemList.map((item) {
            return InkWell(
              onTap: () {},
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

  @override
  void initState() {}
}
