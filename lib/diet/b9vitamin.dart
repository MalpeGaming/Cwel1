import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_chart.dart';
import 'create_second_page.dart';
import '../app_bar.dart';
import '../buttons.dart';
import 'b6vitamin.dart';

class B9Vitamin extends StatefulWidget {
  const B9Vitamin({super.key});

  @override
  State<B9Vitamin> createState() => _B9Vitamin();
}

class _B9Vitamin extends State<B9Vitamin> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('14+ years', 400),
      ChartData('9-13 years', 300),
    ];

    final List<ChartData> chartData2 = [
      ChartData('14+ years', 400),
      ChartData('9-13 years', 300),
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
                    "B-VITAMINS",
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
              'RECOMMENDED DOSES - B9',
              style: TextStyle(fontSize: size.width / 22),
            ),
            Row(
              children: [
                Text(
                  'Data Source: ',
                  style: TextStyle(
                    fontSize: size.width / 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Text(
                      'https://ods.od.nih.gov/factsheets/Folate-HealthProfessional/',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 0.012 * size.height,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () => launchUrl(
                      Uri.parse(
                        'https://ods.od.nih.gov/factsheets/Folate-HealthProfessional/',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildChart(context, chartData, chartData2, 100, 0.3, unit: 'mcg'),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const B9VitaminV2(),
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

class B9VitaminV2 extends StatefulWidget {
  const B9VitaminV2({super.key});

  @override
  State<B9VitaminV2> createState() => _B9VitaminV2();
}

class _B9VitaminV2 extends State<B9VitaminV2> {
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
              'B9 - Vit.',
              doses: false,
              funcText: ' - B9',
              'https://www.nature.com/articles/nrn2421',
              'https://ods.od.nih.gov/factsheets/Folate-HealthProfessional/',
              RichText(
                text: TextSpan(
                  text:
                      'Supplementation with vitamin B12 has positive effects on memory performance in women.',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: size.width / 25,
                    height: 1.2,
                  ),
                ),
              ),
              ['Fish ', 'Eggs', 'Green Vegetables', 'Fruit'],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const B6Vitamin(),
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
