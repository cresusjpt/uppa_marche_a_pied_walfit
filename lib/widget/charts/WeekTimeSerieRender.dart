import 'package:flutter/material.dart';
import 'package:marche_a_pied/widget/charts/TimeSeriesWeekBar.dart';


class WeekTimeSerieRender extends StatefulWidget {
  @override
  _WeekTimeSerieRenderState createState() => _WeekTimeSerieRenderState();
}

class _WeekTimeSerieRenderState extends State<WeekTimeSerieRender> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 200,
        width: double.infinity,
        child: TimeSeriesWeekBar.withSampleData(),
      ),
    );
  }
}