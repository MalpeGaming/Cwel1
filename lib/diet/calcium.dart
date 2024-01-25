import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_chart.dart';
import 'create_second_page.dart';
import '../app_bar.dart';
import '../buttons.dart';

class Calcium extends StatefulWidget {
  const Calcium({super.key});

  @override
  State<Calcium> createState() => _Calcium();
}

class _Calcium extends State<Calcium> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('71+ years', 1200),
      ChartData('51-70 years', 1200),
      ChartData('19-50 years', 1000),
      ChartData('9-18 years', 1300),
    ];

    final List<ChartData> chartData2 = [
      ChartData('71+ years', 1200),
      ChartData('51-70 years', 1000),
      ChartData('19-50 years', 1000),
      ChartData('9-18 years', 1300),
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
                    "CALCIUM",
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
                      'https://ods.od.nih.gov/factsheets/Calcium-HealthProfessional/',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 0.012 * size.height,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () => launchUrl(Uri.parse(
                        'https://ods.od.nih.gov/factsheets/Calcium-HealthProfessional/')),
                  ),
                ),
              ],
            ),
            buildChart(context, chartData, chartData2, 400, 0.5, unit: 'mg'),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const CalciumV2(),
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

class CalciumV2 extends StatefulWidget {
  const CalciumV2({super.key});

  @override
  State<CalciumV2> createState() => _CalciumV2();
}

class _CalciumV2 extends State<CalciumV2> {
  @override
  Widget build(BuildContext context) {
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
            createSecondPage(
              context,
              'CALCIUM',
              doses: false,
              'https://www.nature.com/articles/nrn2421',
              'https://ods.od.nih.gov/factsheets/Calcium-HealthProfessional/',
              RichText(
                text: TextSpan(
                  text:
                      'Low serum calcium is associated with slower cognitive decline in the elderly',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: size.width / 25,
                    height: 1.2,
                  ),
                ),
              ),
              ['Milk', 'Tofu', 'Plain Yogurt', 'Mozzarella'],
            ),
          ],
        ),
      ),
    );
  }
}
