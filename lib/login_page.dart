import 'package:flutter/material.dart';
import 'language_level_selection.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
              left: size.width / 10,
              right: size.width / 10,
              top: size.height / 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "IMPROVE YOUR",
                style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.w500,
                    height: 1),
                textAlign: TextAlign.center,
              ),
              Text(
                "BRAIN",
                style: TextStyle(
                    fontSize: size.width / 5,
                    fontWeight: FontWeight.w400,
                    height: 1),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 0.01 * size.height),
              Text(
                "IN 30 DAYS!",
                style: TextStyle(fontSize: size.width / 16),
              ),
              SizedBox(height: 0.05 * size.height),
              Container(
                margin: EdgeInsets.all(size.width / 14.0),
                child: Image.asset('assets/brain.png'),
              ),
              SizedBox(height: 0.1 * size.height),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                      fontSize: size.width / 23,
                      color: Theme.of(context).colorScheme.onSecondary),
                  children: [
                    const TextSpan(
                      text: "(CLICK BELOW ",
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.arrow_downward,
                        size: size.width / 23,
                      ),
                    ),
                    const TextSpan(
                      text: " TO START \nTHE FREE TEST)",
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 50),
              SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LanguageLevelSelection(
                          widget.title,
                        ),
                      ),
                    );
                  },
                  tooltip: 'Smart decision',
                  label: Text(
                    "Click!",
                    style: TextStyle(fontSize: size.width / 16),
                  ),
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    size: size.width / 16,
                  ),
                  backgroundColor: Colors.blue[400],
                  hoverColor: Colors.blue[900],
                  autofocus: true,
                  heroTag: "next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
