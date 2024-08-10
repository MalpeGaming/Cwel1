import 'package:flutter/material.dart';
import '/app_bar.dart';
import '/buttons.dart';
import 'meditation_minutes.dart';

class Meditation extends StatefulWidget {
  const Meditation({super.key});

  @override
  State<Meditation> createState() => _Meditation();
}

class _Meditation extends State<Meditation> {
  Column buildPoint(
    BuildContext context,
    int num,
    Color? color,
    String txt1,
    String txt2,
  ) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 0.1125 * size.width,
                width: 0.1125 * size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Center(
                  child: Text(
                    num.toString(),
                    style: TextStyle(
                      color: color!,
                      fontSize: size.width / 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width / 15),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 0.02 * size.height,
                    height: 1.2,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: txt1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: txt2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: size.height / 30),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
          top: size.height / 50,
          bottom: size.height / 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "MEDITATION",
                    style: TextStyle(
                      fontSize: size.width / 9,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'STEP BY STEP',
                    style: TextStyle(fontSize: size.width / 22),
                  ),
                ),
                SizedBox(height: 0.04 * size.height),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontStyle: FontStyle.italic,
                      fontSize: size.width / 25,
                      height: 1.2,
                    ),
                    children: const [
                      WidgetSpan(
                        child: SizedBox(
                          width: 15.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Meditation offers a path to ',
                      ),
                      TextSpan(
                        text:
                            'inner peace, reduced stress, increased focus, and enhanced emotional balance. ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height / 17.5),
                Text(
                  'BEFORE YOU BEGIN',
                  style: TextStyle(fontSize: 0.025 * size.height),
                ),
                SizedBox(height: size.height / 25),
                buildPoint(
                  context,
                  1,
                  Colors.blue[100],
                  'Find a Quiet Place',
                  ': You can either go outdoors or stay indoors.',
                ),
                buildPoint(
                  context,
                  2,
                  Colors.green[100],
                  'Get Comfortable',
                  ": You can sit on a cushion or chair, or even lie down if that's more comfortable for you.",
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const MeditationMinutes(),
                  text: 'Continue',
                  width: size.width,
                ),
              ),
            ),
            SizedBox(height: size.height / 15),
          ],
        ),
      ),
    );
  }
}
