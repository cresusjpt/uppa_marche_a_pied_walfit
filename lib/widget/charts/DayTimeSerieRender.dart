import 'package:flutter/material.dart';
import 'package:marche_a_pied/widget/charts/TimeSeriesDayBar.dart';

class DayTimeSerieRender extends StatefulWidget {
  @override
  _DayTimeSerieRenderState createState() => _DayTimeSerieRenderState();
}

class _DayTimeSerieRenderState extends State<DayTimeSerieRender> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 200,
        width: double.infinity,
        child: TimeSeriesDayBar.withSampleData(),
      ),
    );
  }
}