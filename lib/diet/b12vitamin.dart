import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_chart.dart';
import 'create_second_page.dart';
import 'b9vitamin.dart';
import '../app_bar.dart';
import '../buttons.dart';

class B12Vitamin extends StatefulWidget {
  const B12Vitamin({super.key});

  @override
  State<B12Vitamin> createState() => _B12Vitamin();
}

class _B12Vitamin extends State<B12Vitamin> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('14+ years', 2.4),
      ChartData('9-13 years', 1.8),
    ];

    final List<ChartData> chartData2 = [
      ChartData('14+ years', 2.4),
      ChartData('9-13 years', 1.8),
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
              'RECOMMENDED DOSES - B12',
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
                      'https://ods.od.nih.gov/factsheets/VitaminB12-HealthProfessional/#h3',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 0.012 * size.height,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () => launchUrl(Uri.parse(
                        'https://ods.od.nih.gov/factsheets/VitaminB12-HealthProfessional/#h3',),),
                  ),
                ),
              ],
            ),
            buildChart(context, chartData, chartData2, 0.5, 0.35, unit: 'mcg'),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const B12VitaminV2(),
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

class B12VitaminV2 extends StatefulWidget {
  const B12VitaminV2({super.key});

  @override
  State<B12VitaminV2> createState() => _B6VitaminV2();
}

class _B6VitaminV2 extends State<B12VitaminV2> {
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
              'B12 - Vit.',
              doses: false,
              funcText: ' - B12',
              'https://www.nature.com/articles/nrn2421',
              'https://ods.od.nih.gov/factsheets/VitaminB12-HealthProfessional/#h3',
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
              ['Fish ', 'Meat', 'Eggs', 'Dairy'],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const B9Vitamin(),
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
