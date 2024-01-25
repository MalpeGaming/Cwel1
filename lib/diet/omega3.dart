import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_chart.dart';
import '../app_bar.dart';
import '../buttons.dart';

class Omega3 extends StatefulWidget {
  const Omega3({super.key});

  @override
  State<Omega3> createState() => _Omega3();
}

class _Omega3 extends State<Omega3> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('51+ years', 1.1),
      ChartData('19-50 years', 1.1),
      ChartData('14-18 years', 1.1),
      ChartData('9-13 years', 1.2),
    ];

    final List<ChartData> chartData2 = [
      ChartData('51+ years', 1.2),
      ChartData('19-50 years', 1.6),
      ChartData('14-18 years', 1.6),
      ChartData('9-13 years', 1.2)
    ];

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(context, ''),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
          bottom: size.height / 15,
        ),
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
            Text(
              'RECOMMENDED DOSES',
              style: TextStyle(fontSize: size.width / 22),
            ),
            Row(
              children: [
                Text(
                  'Data Source: ',
                  style: TextStyle(
                      fontSize: size.width / 30, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: InkWell(
                    child: Text(
                      'https://ods.od.nih.gov/factsheets/Omega3FattyAcids-HealthProfessional/#h2',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 0.012 * size.height,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () => launchUrl(Uri.parse(
                        'https://ods.od.nih.gov/factsheets/Omega3FattyAcids-HealthProfessional/#h2')),
                  ),
                ),
              ],
            ),
            buildChart(context, chartData, chartData2, 0.5, 0.5),
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
