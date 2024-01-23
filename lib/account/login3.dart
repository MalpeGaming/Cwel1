import 'package:flutter/material.dart';
import '/buttons.dart';
import '/home.dart';

class Login3 extends StatefulWidget {
  const Login3({super.key});

  @override
  State<Login3> createState() => _Login3();
}

class _Login3 extends State<Login3> {
  TextEditingController textController = TextEditingController();

  int? selectedOption;

  ListTile createPoint(
      BuildContext context, Size size, String text1, String text2, int val) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: text1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 0.025 * size.height,
              ),
            ),
            TextSpan(
              text: text2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 0.02 * size.height,
              ),
            ),
          ],
        ),
      ),
      leading: Radio<int>(
        value: val,
        groupValue: selectedOption,
        activeColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            selectedOption = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width * 0.9,
        margin: EdgeInsets.symmetric(
          horizontal: size.width / 20,
          vertical: size.height / 20,
        ),
        child: Column(
          children: [
            SizedBox(height: 0.05 * size.height),
            Align(
              alignment: Alignment.center,
              child: Text(
                "APART FROM THE BRAIN TRAIN ACTIVITIES",
                style: TextStyle(fontSize: 0.025 * size.height),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "I WOULD LIKE MY PROGRAM TO INCLUDE",
                style: TextStyle(
                  fontSize: 0.035 * size.height,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.07 * size.height),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createPoint(context, size, "Sport\n",
                    " (on average 15 min per day)", 1),
                createPoint(context, size, "Wellness Activities\n",
                    " (5 min per day)", 2),
                createPoint(
                    context, size, "Both\n", " (on average 17 min per day)", 3),
                createPoint(context, size, "None\n", " (no additional time)", 4)
              ],
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const Home(),
                  text: 'Continue',
                  width: size.width,
                  requirement: selectedOption != null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
