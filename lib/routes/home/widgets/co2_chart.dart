import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class Co2Chart extends StatelessWidget {
  const Co2Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BarChart(BarChartData(barGroups: [
        BarChartGroupData(x: 1, barRods: [BarChartRodData(y: 8)]),
        BarChartGroupData(x: 2, barRods: [BarChartRodData(y: 7)]),
        BarChartGroupData(x: 3, barRods: [BarChartRodData(y: 6)]),
        BarChartGroupData(x: 4, barRods: [BarChartRodData(y: 5)]),
        BarChartGroupData(x: 5, barRods: [BarChartRodData(y: 4)]),
      ]
          // read about it in the BarChartData section
          )),
    );
  }
}
