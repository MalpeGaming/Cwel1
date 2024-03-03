import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login2.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1();
}

Column createForm(
  Size size,
  String label,
  String hint,
  TextEditingController textController,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 0.025 * size.height),
      ),
      SizedBox(height: 0.01 * size.height),
      SizedBox(
        height: 0.05 * size.height,
        child: TextField(
          controller: textController,
          inputFormatters: [
            TextInputFormatter.withFunction((oldValue, newValue) {
              return newValue;
            }),
          ],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 0.005 * size.height,
              horizontal: 0.02 * size.height,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.01 * size.height),
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.blue[400]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.01 * size.height),
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.blue[600]!,
              ),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ],
  );
}

class _Login1 extends State<Login1> {
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.apple,
                  size: 50,
                ),
                Icon(
                  Icons.facebook,
                  size: 50,
                ),
                Icon(
                  Icons.g_mobiledata,
                  size: 50,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login2(),
                      ),
                    );
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
