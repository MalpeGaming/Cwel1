import 'package:flutter/material.dart';
import '/navbar.dart';
import 'tos.dart';
import 'contact.dart';
import '../../app_bar.dart';
import 'functions.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  List<String> settings = [
    "Terms of Use",
    "Contact Us",
    "Restart The App",
    "End The Program",
    "Our Website",
    "Your Certificates",
  ];
  List<int> icons = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];
  List<Widget> routes = [
    const TermsOfService(),
    const Contact(),
    const Restart(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];
  List<bool> colors = [false, false, false, false, false, false];
  Widget element(
    BuildContext context,
    int index,
  ) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        (index != 4)
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => routes[index]),
              )
            : Site.launch();
      },
      onTapUp: (details) => setState(
        () {
          if (icons[index] > 6) {
            icons[index] -= 6;
          }
          colors[index] = false;
          print(icons);
        },
      ),
      onTapDown: (details) {
        setState(() {
          if (icons[index] <= 6) {
            icons[index] += 6;
          }
          colors[index] = true;
          print("amogus");
          print(icons);
        });
      },
      onTapCancel: () => setState(() {
        if (icons[index] > 6) {
          icons[index] -= 6;
        }
        colors[index] = false;
        print(icons);
      }),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colors[index]
                    ? const Color(0xFF004AAD)
                    : Theme.of(context).colorScheme.primary,
                width: 4.0,
              ),
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(2137.0),
            ),
            width: double.infinity,
            height: size.height * 0.07,
            //margin: EdgeInsets.only(top: 10),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colors[index]
                            ? const Color(0xFF004AAD)
                            : Theme.of(context).colorScheme.primary,
                        width: 4.0,
                      ),
                    ),
                    height: size.height * 0.07,
                    width: size.height * 0.07,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "assets/settings/${icons[index]}.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  settings[index],
                  style: TextStyle(fontSize: size.width / 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "SETTINGS",
                  style: TextStyle(
                    fontSize: size.width / 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 0.05 * size.height),
              Column(
                children: List.generate(
                  6,
                  (index) => Column(
                    children: [
                      element(context, index),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
