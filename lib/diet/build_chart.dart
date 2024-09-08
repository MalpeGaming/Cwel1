import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String? x;
  final double? y;
}

buildChart(
  BuildContext context,
  List<ChartData> chartData,
  List<ChartData> chartData2,
  double interval,
  double h, {
  String unit = 'g',
}) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    height: h * size.height,
    child: SfCartesianChart(
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        legendItemBuilder:
            (String name, dynamic series, dynamic point, int index) {
          return SizedBox(
            width: 80,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: (series as BarSeries<ChartData, String>).color,
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                  ),
                  width: 10,
                  height: 10,
                ),
                const SizedBox(width: 8),
                Text(name == 'Male' ? 'Male' : 'Female'),
              ],
            ),
          );
        },
      ),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        labelRotation: 310,
        labelFormat: '{value} $unit',
        interval: interval,
      ),
      series: <CartesianSeries>[
        BarSeries<ChartData, String>(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          color: Theme.of(context).colorScheme.primary,
          width: 0.8,
          name: 'Female',
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x!,
          yValueMapper: (ChartData data, _) => data.y!,
        ),
        BarSeries<ChartData, String>(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          color: (Theme.of(context).brightness == Brightness.dark)
              ? const Color.fromARGB(255, 75, 31, 102)
              : const Color.fromARGB(255, 31, 76, 145),
          width: 0.8,
          name: 'Male',
          dataSource: chartData2,
          xValueMapper: (ChartData data, _) => data.x!,
          yValueMapper: (ChartData data, _) => data.y!,
        ),
      ],
    ),
  );
}
