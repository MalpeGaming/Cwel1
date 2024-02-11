import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_chart.dart';
import 'create_second_page.dart';
import '../app_bar.dart';
import '../buttons.dart';

class Zinc extends StatefulWidget {
  const Zinc({super.key});

  @override
  State<Zinc> createState() => _Zinc();
}

class _Zinc extends State<Zinc> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('19+ years', 8),
      ChartData('14-18 years', 9),
      ChartData('9-13 years', 8),
    ];

    final List<ChartData> chartData2 = [
      ChartData('19+ years', 11),
      ChartData('14-18 years', 11),
      ChartData('9-13 years', 8),
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
                    "Zinc",
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
                      'https://ods.od.nih.gov/factsheets/Zinc-Consumer/',
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
                        'https://ods.od.nih.gov/factsheets/Zinc-Consumer/',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildChart(context, chartData, chartData2, 2, 0.45, unit: 'mg'),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const ZincV2(),
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

class ZincV2 extends StatefulWidget {
  const ZincV2({super.key});

  @override
  State<ZincV2> createState() => _ZincV2();
}

class _ZincV2 extends State<ZincV2> {
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
              'ZINC',
              doses: false,
              'https://www.nature.com/articles/nrn2421',
              'https://ods.od.nih.gov/factsheets/Zinc-Consumer/',
              RichText(
                text: TextSpan(
                  text:
                      'Reduction of zinc in diet helps to reduce cognitive decay in the elderly.',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: size.width / 25,
                    height: 1.2,
                  ),
                ),
              ),
              ['Meat', 'Fish', 'Oysters', 'Nuts'],
            ),
          ],
        ),
      ),
    );
  }
}
