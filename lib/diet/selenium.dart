import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_chart.dart';
import 'create_second_page.dart';
import '../app_bar.dart';
import '../buttons.dart';

class Selenium extends StatefulWidget {
  const Selenium({super.key});

  @override
  State<Selenium> createState() => _Selenium();
}

class _Selenium extends State<Selenium> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('14+ years', 55),
      ChartData('9-13 years', 40),
    ];

    final List<ChartData> chartData2 = [
      ChartData('14+ years', 55),
      ChartData('9-13 years', 40),
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
                    "Selenium",
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
                      fontSize: size.width / 30, fontWeight: FontWeight.bold,),
                ),
                Expanded(
                  child: InkWell(
                    child: Text(
                      'https://ods.od.nih.gov/factsheets/Selenium-HealthProfessional/',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 0.012 * size.height,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () => launchUrl(Uri.parse(
                        'https://ods.od.nih.gov/factsheets/Selenium-HealthProfessional/',),),
                  ),
                ),
              ],
            ),
            buildChart(context, chartData, chartData2, 20, 0.3, unit: 'mcg'),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const SeleniumV2(),
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

class SeleniumV2 extends StatefulWidget {
  const SeleniumV2({super.key});

  @override
  State<SeleniumV2> createState() => _SeleniumV2();
}

class _SeleniumV2 extends State<SeleniumV2> {
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
              'SELENIUM',
              doses: false,
              'https://www.nature.com/articles/nrn2421',
              'https://ods.od.nih.gov/factsheets/Selenium-HealthProfessional/',
              RichText(
                text: TextSpan(
                  text:
                      'Lifelong high selenium level associated with higher cognitive function in humans',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: size.width / 25,
                    height: 1.2,
                  ),
                ),
              ),
              ['Tuna', 'Ham', 'Chicken', 'Nuts'],
            ),
          ],
        ),
      ),
    );
  }
}
