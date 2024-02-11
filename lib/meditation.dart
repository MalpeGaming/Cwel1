import 'package:flutter/material.dart';
import 'app_bar.dart';

class Meditation extends StatefulWidget {
  const Meditation({super.key});

  @override
  State<Meditation> createState() => _Meditation();
}

class _Meditation extends State<Meditation> {
  Column buildPoint(
      BuildContext context, int num, Color? color, String txt1, String txt2,) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Center(
              child: Container(
                height: 0.1 * size.width,
                width: 0.1 * size.width,
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
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width / 25),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 0.019 * size.height,
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
        SizedBox(height: 0.025 * size.height),
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
                    "MEDITATION",
                    style: TextStyle(
                      fontSize: size.width / 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    'SHORT GUIDE',
                    style: TextStyle(fontSize: size.width / 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.04 * size.height),
              ],
            ),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'Meditation offers a path to ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontStyle: FontStyle.italic,
                  fontSize: size.width / 25,
                  height: 1.2,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text:
                        'inner peace, reduced stress, increased focus, and enhanced emotional balance. ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height / 20),
            Text(
              'HOW TO START - STEP BY STEP',
              style: TextStyle(fontSize: 0.025 * size.height),
            ),
            SizedBox(height: size.height / 30),
            Column(
              children: [
                buildPoint(context, 1, Colors.blue[100], 'Find a Quiet Place',
                    ': You can either go outdoors or stay indoors.',),
                buildPoint(context, 2, Colors.green[100], 'Get Comfortable',
                    ": You can sit on a cushion or chair, or even lie down if that's more comfortable for you.",),
                buildPoint(context, 3, Colors.orange[100], 'Set a Timer',
                    ': I recommend starting with 1 minute.',),
                buildPoint(
                    context,
                    4,
                    Colors.red[100],
                    'Close Your Eyes and Focus on Your Breath',
                    ': Do your best to stop thinking and relax : )',),
                buildPoint(context, 5, Colors.purple[100], 'Practice Daily',
                    ': Even 2 minutes will make a difference.',),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
