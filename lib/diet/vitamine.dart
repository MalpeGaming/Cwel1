import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_chart.dart';
import 'create_second_page.dart';
import '../app_bar.dart';
import '../buttons.dart';

class VitaminE extends StatefulWidget {
  const VitaminE({super.key});

  @override
  State<VitaminE> createState() => _VitaminE();
}

class _VitaminE extends State<VitaminE> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('14+ years', 15),
      ChartData('9-13 years', 11),
    ];

    final List<ChartData> chartData2 = [
      ChartData('14+ years', 15),
      ChartData('9-13 years', 11),
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
                    "Vitamin E",
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
                    fontSize: size.width / 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Text(
                      'https://ods.od.nih.gov/factsheets/VitaminE-HealthProfessional/#h2',
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
                        'https://ods.od.nih.gov/factsheets/VitaminE-HealthProfessional/#h2',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildChart(context, chartData, chartData2, 5, 0.3, unit: 'mg'),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const VitaminEV2(),
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

class VitaminEV2 extends StatefulWidget {
  const VitaminEV2({super.key});

  @override
  State<VitaminEV2> createState() => _VitaminEV2();
}

class _VitaminEV2 extends State<VitaminEV2> {
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
              'VITAMIN E',
              doses: false,
              'https://www.nature.com/articles/nrn2421',
              'https://ods.od.nih.gov/factsheets/VitaminE-HealthProfessional/#h2',
              RichText(
                text: TextSpan(
                  text:
                      'Ameliorates the brain recovery, and reduces cognitive decay in the elderly.',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: size.width / 25,
                    height: 1.2,
                  ),
                ),
              ),
              ['Oil', 'Nuts', 'Broccoli', 'Spinach'],
            ),
          ],
        ),
      ),
    );
  }
}
