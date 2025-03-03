import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'build_chart.dart';
import 'create_second_page.dart';
import '../app_bar.dart';
import '../buttons.dart';

class VitaminD extends StatefulWidget {
  const VitaminD({super.key});

  @override
  State<VitaminD> createState() => _VitaminD();
}

class _VitaminD extends State<VitaminD> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('71+ years', 20),
      ChartData('1-70 years', 15),
    ];

    final List<ChartData> chartData2 = [
      ChartData('71+ years', 20),
      ChartData('1-70 years', 15),
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
                    "Vitamin D",
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
                      'https://ods.od.nih.gov/factsheets/VitaminD-Consumer/',
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
                        'https://ods.od.nih.gov/factsheets/VitaminD-Consumer/',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildChart(context, chartData, chartData2, 5, 0.3, unit: 'mcg'),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const VitaminDV2(),
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

class VitaminDV2 extends StatefulWidget {
  const VitaminDV2({super.key});

  @override
  State<VitaminDV2> createState() => _B6VitaminV2();
}

class _B6VitaminV2 extends State<VitaminDV2> {
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
              'VITAMIN D',
              doses: false,
              'https://www.nature.com/articles/nrn2421',
              'https://ods.od.nih.gov/factsheets/VitaminD-Consumer/',
              RichText(
                text: TextSpan(
                  text:
                      'It is important for the proper cognitive functions especially in the elderly.',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: size.width / 25,
                    height: 1.2,
                  ),
                ),
              ),
              ['Fish ', 'Eggs', 'Vit D fortified food', 'Milk'],
            ),
          ],
        ),
      ),
    );
  }
}
