import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ProgressChart extends StatelessWidget {
  final List<charts.Series<dynamic, num>> seriesList;
  const ProgressChart({super.key, required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(seriesList, animate: true);
  }
}
