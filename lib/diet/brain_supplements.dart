import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_bar.dart';
import '../your_activities.dart';
import 'omega3.dart';
import 'b12vitamin.dart';
import 'vitamind.dart';
import 'vitamine.dart';
import 'choline.dart';
import 'calcium.dart';
import 'zinc.dart';
import 'selenium.dart';
import 'copper.dart';
import 'iron.dart';
import 'flavonoids.dart';
import 'antioxidants.dart';

class BrainSupplements extends StatefulWidget {
  const BrainSupplements({super.key});

  @override
  State<BrainSupplements> createState() => _BrainSupplements();
}

class _BrainSupplements extends State<BrainSupplements> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
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
                    "BRAIN SUPPLEMENTS",
                    style: TextStyle(
                      fontSize: size.width / 9,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.03 * size.height),
            Expanded(
              child: ListView(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Taking supplements can be important ',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: size.width / 24,
                        height: 1.2,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'to fill nutritional gaps in our diets',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                ', ensuring that our bodies receive essential vitamins and minerals necessary for ',),
                        TextSpan(
                          text: 'good brain health.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.04 * size.height),
                  createActivity(context, "diet/omega3", "Omega-3", "",
                      0.03 * size.height, const Omega3(),
                      zero: 0,),
                  createActivity(context, "diet/bvitamins", "B-Vitamins", "",
                      0.03 * size.height, const B12Vitamin(),
                      zero: 0,),
                  createActivity(context, "diet/flavonoids", "Flavonoids", "",
                      0.03 * size.height, const Flavonoids(),
                      zero: 0,),
                  createActivity(context, "diet/vitamind", "Vitamin D", "",
                      0.03 * size.height, const VitaminD(),
                      zero: 0,),
                  createActivity(context, "diet/vitamine", "Vitamin E", "",
                      0.03 * size.height, const VitaminE(),
                      zero: 0,),
                  createActivity(context, "diet/choline", "Choline", "",
                      0.03 * size.height, const Choline(),
                      zero: 0,),
                  createActivity(context, "diet/antioxidants", "Antioxidants",
                      "", 0.03 * size.height, const Antioxidants(),
                      zero: 0,),
                  createActivity(context, "diet/calcium", "Calcium", "",
                      0.03 * size.height, const Calcium(),
                      zero: 0,),
                  createActivity(context, "diet/zinc", "Zinc", "",
                      0.03 * size.height, const Zinc(),
                      zero: 0,),
                  createActivity(context, "diet/selenium", "Selenium", "",
                      0.03 * size.height, const Selenium(),
                      zero: 0,),
                  createActivity(context, "diet/copper", "Copper", "",
                      0.03 * size.height, const Copper(),
                      zero: 0,),
                  createActivity(context, "diet/iron", "Iron", "",
                      0.03 * size.height, const Iron(),
                      zero: 0,),
                  Text(
                    'Want to see the full study?',
                    style: TextStyle(fontSize: 0.025 * size.height),
                  ),
                  InkWell(
                    child: Text(
                      'https://www.nature.com/articles/nrn2421',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 0.02 * size.height,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () => launchUrl(
                        Uri.parse('https://www.nature.com/articles/nrn2421'),),
                  ),
                  SizedBox(height: 0.1 * size.height),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
