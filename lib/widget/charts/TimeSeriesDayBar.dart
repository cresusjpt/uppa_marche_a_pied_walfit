import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:marche_a_pied/models/Activity.dart';

class TimeSeriesDayBar extends StatelessWidget {
  final List<charts.Series<TimeSeriesSales, DateTime>> seriesList;
  final bool animate;

  TimeSeriesDayBar(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeSeriesDayBar.withSampleData() {
    return new TimeSeriesDayBar(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  factory TimeSeriesDayBar.customData(
      List<Activity> activity) {
    return new TimeSeriesDayBar(
      _createCustomData(activity),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Set the default renderer to a bar renderer.
      // This can also be one of the custom renderers of the time series chart.
      defaultRenderer: new charts.BarRendererConfig<DateTime>(),
      // It is recommended that default interactions be turned off if using bar
      // renderer, because the line point highlighter is the default for time
      // series chart.
      defaultInteractions: false,
      // If default interactions were removed, optionally add select nearest
      // and the domain highlighter that are typical for bar charts.
      behaviors: [new charts.SelectNearest(), new charts.DomainHighlighter()],
      domainAxis: charts.DateTimeAxisSpec(
          tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
              hour: charts.TimeFormatterSpec(
        format: 'HH',
        transitionFormat: 'HH',
        //noonFormat: 'h'
      ))),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      TimeSeriesSales(new DateTime(2021, 01, 11, 0), 1470),
      TimeSeriesSales(new DateTime(2021, 01, 11, 1), 0),
      TimeSeriesSales(new DateTime(2021, 01, 11, 2), 0),
      TimeSeriesSales(new DateTime(2021, 01, 11, 3), 15),
      TimeSeriesSales(new DateTime(2021, 01, 11, 4), 1508),
      TimeSeriesSales(new DateTime(2021, 01, 11, 5), 147),
      TimeSeriesSales(new DateTime(2021, 01, 11, 6), 0),
      TimeSeriesSales(new DateTime(2021, 01, 11, 7), 3660),
      TimeSeriesSales(new DateTime(2021, 01, 11, 8), 800),
      TimeSeriesSales(new DateTime(2021, 01, 11, 9), 780),
      TimeSeriesSales(new DateTime(2021, 01, 11, 10), 3000),
      TimeSeriesSales(new DateTime(2021, 01, 11, 11), 4856),
      TimeSeriesSales(new DateTime(2021, 01, 11, 12), 999),
      TimeSeriesSales(new DateTime(2021, 01, 11, 13), 2301),
      TimeSeriesSales(new DateTime(2021, 01, 11, 14), 4523),
      TimeSeriesSales(new DateTime(2021, 01, 11, 15), 3620),
      TimeSeriesSales(new DateTime(2021, 01, 11, 16), 5789),
      TimeSeriesSales(new DateTime(2021, 01, 11, 17), 2503),
      TimeSeriesSales(new DateTime(2021, 01, 11, 18), 1410),
      TimeSeriesSales(new DateTime(2021, 01, 11, 19), 6000),
      TimeSeriesSales(new DateTime(2021, 01, 11, 20), 621),
      TimeSeriesSales(new DateTime(2021, 01, 11, 21), 5478),
      TimeSeriesSales(new DateTime(2021, 01, 11, 22), 2563),
      TimeSeriesSales(new DateTime(2021, 01, 11, 23), 4152),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
        displayName: "jfiofjgdf",
      )
    ];
  }

  /// Create one series with custom  data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createCustomData(
      List<Activity> activities) {
    List<TimeSeriesSales> data = List();
    activities.forEach((element) {
      int hours = int.parse(element.heureDebutRemote.split(":").elementAt(0));
      data.add(TimeSeriesSales(element.dateActivity.add(Duration(hours: hours)), element.step));
    });

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Activities',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
        displayName: "Activity",
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
