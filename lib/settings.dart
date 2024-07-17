import 'package:flutter/material.dart';
import '/navbar.dart';

import '../app_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  Widget element(
      BuildContext context, String title, Widget route, String icon) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(2137.0),
        ),
        width: double.infinity,
        //margin: EdgeInsets.only(top: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.06,
                width: size.height * 0.06,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3.0,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    icon,
                    height: size.height * 0.035,
                    width: size.height * 0.035,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Text(
                title,
                style: TextStyle(fontSize: size.width / 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> settings = [
    "Terms of Use",
    "Contact Us",
    "Restart The App",
    "End The Program",
    "Our Website",
    "Your Certificates",
  ];
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
                children: settings.asMap().entries.map((entry) {
                  int index = entry.key;
                  String setting = entry.value;
                  return Column(
                    children: [
                      element(context, setting, const Text("xd"),
                          "assets/settings/${index + 1}.png"),
                      SizedBox(
                          height: size.height *
                              0.03), // Add SizedBox after each element
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
