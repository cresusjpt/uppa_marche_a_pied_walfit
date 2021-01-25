import 'package:flutter/material.dart';
import 'package:marche_a_pied/ui/example/WithBarRenderer.dart';

class ContainerChartExamples extends StatefulWidget {
  @override
  _ContainerChartExamplesState createState() => _ContainerChartExamplesState();
}

class _ContainerChartExamplesState extends State<ContainerChartExamples> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          height: 200,
          width: double.infinity,
          child: TimeSeriesBar.withSampleData(),
        ),
      );
  }
}
