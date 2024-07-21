import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'navbar.dart';
import 'activities_for_each_section.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  late SharedPreferences prefs;
  String skill = "";
  int trainingTime = 0;
  var rng = Random();
  List<String> plan = [];
  int day = 0;

  Future<void> calcDay() async {
    DateTime firstDay = DateTime.now();
    DateTime today = DateTime.now();
    prefs = await SharedPreferences.getInstance();
    String beginningDate = prefs.getString('beginning_date')!;
    print(beginningDate);
    firstDay = DateTime.parse(beginningDate);

    setState(() {
      day = today.difference(firstDay).inDays + 1;
    });
  }

  Future<void> readMemory() async {
    prefs = await SharedPreferences.getInstance();
    print("amogus");
    print(prefs.getString('beginning_date'));
    String? beginningDate = prefs.getString('beginning_date');
    if (beginningDate != null) {
      DateTime beginningDateTime = DateTime.parse(beginningDate);
      Duration daysPassed = DateTime.now().difference(beginningDateTime);
      print("Days passed since beginning date: ${daysPassed.inDays}");
    }
  }

  Future<void> getSkill() async {
    prefs = await SharedPreferences.getInstance();
    String newSkill = prefs.getString('skill')!;
    int newTrainingTime = prefs.getInt('training_time')!;
    //var skillList = skillLists[skill]![0].first;

    //while (currentTime < newTrainingTime) {
    //  int el = rng.nextInt(skillLists[skill]!.length);
    //  skillList.removeAt(el);
    //}
    setState(() {
      skill = newSkill;
      trainingTime = newTrainingTime;
    });
  }

  Future<void> createPlan() async {
    prefs = await SharedPreferences.getInstance();
    List<String> newPlan = prefs.getStringList("basePlanDay$day") ?? [];
    if (newPlan.isNotEmpty) {
      setState(() {
        plan = newPlan;
      });
      return;
    }
    var skillBaseList = List.from(skillBaseLists[skill]!);

    int currentTime = 0;

    while (currentTime < trainingTime) {
      int el = rng.nextInt(skillBaseList.length);
      print("!!!!");
      print(skillBaseList[el].toList()[0].toString());
      newPlan.add(skillBaseList[el].toString());
      currentTime += skillBaseList[el].toList()[1] as int;
      skillBaseList.removeAt(el);
    }
    prefs.setStringList("basePlanDay$day", newPlan);
    setState(() {
      plan = newPlan;
    });
  }

  @override
  void initState() {
    super.initState();
    calcDay();
    readMemory();
    getSkill();
    createPlan();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    var formatter = DateFormat('E. dd MMM');
    String formattedDate = formatter.format(now);

    //print("Xd");
    //readMemory();

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
          top: size.height / 10,
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
                    "YOUR PLAN",
                    style: TextStyle(
                      fontSize: size.width / 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    "DAY 1 - ${formattedDate.toString().toUpperCase()}",
                    style: TextStyle(fontSize: size.width / 17),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.05 * size.height),
            Text(
              "Base program",
              style: TextStyle(
                fontSize: size.width / 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            ListTile(
              autofocus: true,
              leading: Radio<int>(
                value: 1,
                groupValue: 1,
                //activeColor: Theme.of(context).colorScheme.primary,
                fillColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary,
                ),
                splashRadius: 25,
                onChanged: (value) {},
              ),
            ),
            Text(skill),
            Text(trainingTime.toString()),
            if (skillBaseLists[skill] != null)
              Text(skillBaseLists[skill]!.length.toString()),
            if (skillBaseLists[skill] != null)
              Text(skillBaseLists[skill]![0][0].toString()),
            Text(plan.toString()),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
