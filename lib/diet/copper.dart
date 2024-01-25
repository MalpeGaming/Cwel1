import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_chart.dart';
import 'create_second_page.dart';
import '../app_bar.dart';
import '../buttons.dart';

class Copper extends StatefulWidget {
  const Copper({super.key});

  @override
  State<Copper> createState() => _Copper();
}

class _Copper extends State<Copper> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('19+ years', 900),
      ChartData('14-18 years', 890),
      ChartData('9-13 years', 700),
    ];

    final List<ChartData> chartData2 = [
      ChartData('19+ years', 900),
      ChartData('14-18 years', 890),
      ChartData('9-13 years', 700),
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
                    "COPPER",
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
                      'https://ods.od.nih.gov/factsheets/Copper-HealthProfessional/',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 0.012 * size.height,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () => launchUrl(Uri.parse(
                        'https://ods.od.nih.gov/factsheets/Copper-HealthProfessional/')),
                  ),
                ),
              ],
            ),
            buildChart(context, chartData, chartData2, 200, 0.45, unit: 'mcg'),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const CopperV2(),
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

class CopperV2 extends StatefulWidget {
  const CopperV2({super.key});

  @override
  State<CopperV2> createState() => _CopperV2();
}

class _CopperV2 extends State<CopperV2> {
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
              'COPPER',
              doses: false,
              'https://www.nature.com/articles/nrn2421',
              'https://ods.od.nih.gov/factsheets/Copper-HealthProfessional/',
              RichText(
                text: TextSpan(
                  text:
                      'Low concentration of copper in the plasma contributes to the cognitive decline in the elderly.',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: size.width / 25,
                    height: 1.2,
                  ),
                ),
              ),
              ['Beef', 'Nuts', 'Chocolate', 'Potatoes'],
            ),
          ],
        ),
      ),
    );
  }
}
