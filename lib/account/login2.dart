import 'package:flutter/material.dart';
import 'login1.dart';
import 'login3.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2();
}

class _Login2 extends State<Login2> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width * 0.9,
        margin: EdgeInsets.symmetric(
          horizontal: size.width / 10,
          vertical: size.height / 20,
        ),
        child: Column(
          children: [
            SizedBox(height: 0.05 * size.height),
            Align(
              alignment: Alignment.center,
              child: Text(
                "LOG IN",
                style: TextStyle(fontSize: 0.08 * size.height),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.05 * size.height),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createForm(
                  size,
                  "Please Enter The Code We Sent You By E-Mail",
                  "1234567",
                  textController,
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    if (textController.text != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login3(),
                        ),
                      );
                    }
                  },
                  tooltip: 'Continue',
                  label: Text(
                    "Continue",
                    style: TextStyle(fontSize: size.width / 16),
                  ),
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    size: size.width / 16,
                  ),
                  backgroundColor: Colors.blue[400],
                  hoverColor: Colors.blue[900],
                  autofocus: true,
                  heroTag: "continue",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
