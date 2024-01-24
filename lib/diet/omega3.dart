import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../app_bar.dart';
import '../buttons.dart';

class Omega3 extends StatefulWidget {
  const Omega3({super.key});

  @override
  State<Omega3> createState() => _Omega3();
}

class ChartData {
  ChartData(this.x, this.y, this.label);
  final String? x;
  final double? y;
  final String? label;
}

class _Omega3 extends State<Omega3> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('51+ years', 1.1, 'Label 4'),
      ChartData('19-50 years', 1.1, 'Label 3'),
      ChartData('14-18 years', 1.1, 'Label 2'),
      ChartData('9-13 years', 1.1, 'Label 1.2'),
    ];

    final List<ChartData> chartData2 = [
      ChartData('51+ years', 1.2, 'Label 4'),
      ChartData('19-50 years', 1.6, 'Label 3'),
      ChartData('14-18 years', 1.6, 'Label 2'),
      ChartData('9-13 years', 1.2, 'Label 1')
    ];

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(context, ''),
      body: Container(
        margin: EdgeInsets.only(bottom: size.height / 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "OMEGA-3",
                    style: TextStyle(
                      fontSize: size.width / 9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    "SHORT GUIDE",
                    style: TextStyle(fontSize: size.width / 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.04 * size.height),
            Container(
                margin: EdgeInsets.only(
                  left: size.width / 10,
                  right: size.width / 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RECOMMENDED DOSES',
                      style: TextStyle(fontSize: size.width / 22),
                    ),
                    SizedBox(height: 0.005 * size.height),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: size.width / 30, color: Colors.black),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Data Source:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' https://ods.od.nih.gov/factsheets/Omega3FattyAcids-HealthProfessional/#h2',
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 0.5 * size.height,
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
                                color: (series as BarSeries<ChartData, String>)
                                    .color,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(3))),
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
                  interval: 1,
                ),
                primaryYAxis: const NumericAxis(
                  labelFormat: '{value}g',
                ),
                series: <CartesianSeries>[
                  BarSeries<ChartData, String>(
                    color: const Color.fromARGB(255, 28, 137, 187),
                    width: 0.8,
                    name: 'Female',
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x!,
                    yValueMapper: (ChartData data, _) => data.y!,
                    dataLabelMapper: (ChartData data, _) => data.label!,
                  ),
                  BarSeries<ChartData, String>(
                    color: const Color.fromARGB(255, 21, 220, 255),
                    width: 0.8,
                    name: 'Male',
                    dataSource: chartData2,
                    xValueMapper: (ChartData data, _) => data.x!,
                    yValueMapper: (ChartData data, _) => data.y!,
                    dataLabelMapper: (ChartData data, _) => data.label!,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const Omega3(),
                  text: 'Continue',
                  width: size.width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
