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
  List<String> basePlanTicked = ["0", "0", "0", "0"];
  int day = 0;
  List<bool> wellBeingTicked = [false, false, false, false];

  Future<void> calcDay() async {
    DateTime firstDay = DateTime.now();
    DateTime today = DateTime.now();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('beginning_date') != null) {
      firstDay = DateTime.parse(prefs.getString('beginning_date')!);
    }

    setState(() {
      day = today.difference(firstDay).inDays + 1;
    });
  }

  Future<void> setWellBeingTicked() async {
    prefs = await SharedPreferences.getInstance();

    List<String> newWellBeingTickedString = ["0", "0", "0", "0"];

    for (int i = 0; i < wellBeingTicked.length; i++) {
      newWellBeingTickedString[i] = (wellBeingTicked[i] ? "1" : "0");
    }
    print("!!");
    print(wellBeingTicked);
    print(newWellBeingTickedString);

    prefs.setStringList("wellBeingTickedDay$day", newWellBeingTickedString);
  }

  Future<void> getWellBeingTicked() async {
    prefs = await SharedPreferences.getInstance();

    List<String> newWellBeingTickedString =
        prefs.getStringList('wellBeingTickedDay$day') ?? [];
    List<bool> newWellBeingTicked = [false, false, false, false];

    for (int i = 0; i < newWellBeingTickedString.length; i++) {
      newWellBeingTicked[i] =
          (newWellBeingTickedString[i] == "1" ? true : false);
    }
    if (newWellBeingTicked.isEmpty) {
      newWellBeingTicked = [false, false, false, false];
    }
    print("!");
    print(newWellBeingTicked);

    setState(() {
      wellBeingTicked = newWellBeingTicked;
    });
  }

  Future<void> getSkill() async {
    prefs = await SharedPreferences.getInstance();
    String newSkill = prefs.getString('skill')!;
    int newTrainingTime = prefs.getInt('training_time')!;

    setState(() {
      skill = newSkill;
      trainingTime = newTrainingTime;
    });
  }

  Future<void> createPlan() async {
    prefs = await SharedPreferences.getInstance();
    List<String> newPlan = prefs.getStringList("basePlanDay$day") ?? [];
    if (newPlan.isNotEmpty) {
      print("day $day");
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
      newPlan.add(skillBaseList[el][0].toString());
      currentTime += skillBaseList[el].toList()[1] as int;
      skillBaseList.removeAt(el);
    }
    prefs.setStringList("basePlanDay$day", newPlan);
    setState(() {
      plan = newPlan;
    });
  }

  Future<void> getBasePlanTicked() async {
    prefs = await SharedPreferences.getInstance();
    List<String> newBasePlanTicked = ["0", "0", "0", "0"];

    for (int i = 0; i < plan.length; ++i) {
      newBasePlanTicked[i] = prefs.getString("${plan[i]}TickedDay$day") ?? "0";
    }
    setState(() {
      basePlanTicked = newBasePlanTicked;
    });
  }

  Future<void> readMemory() async {
    await calcDay();
    await getSkill();
    await getWellBeingTicked();
    await createPlan();
    await getBasePlanTicked();
  }

  @override
  initState() {
    super.initState();
    readMemory();
  }

  Widget createBaseProgram(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        for (int i = 0; i < plan.length; i++)
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width / 12,
                    child: Icon(
                      (basePlanTicked[i] == "1")
                          ? Icons.done_all
                          : Icons.done_rounded,
                      size: basePlanTicked[i] == "1"
                          ? size.width / 12
                          : size.width / 15,
                      color: basePlanTicked[i] == "1"
                          ? Colors.green
                          : Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.3),
                    ),
                  ),
                  SizedBox(width: size.width / 40),
                  Flexible(
                    child: Text(
                      "${sectionNames[plan[i]]} - ${sectionTimes[plan[i]]} min",
                      style: TextStyle(
                        fontSize: size.width / 22,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.01 * size.height),
            ],
          ),
      ],
    );
  }

  Widget createWellBeing(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Column(
        children: [
          for (int i = 0; i < wellbeing.length; i++)
            InkWell(
              onTap: () {
                setState(() {
                  wellBeingTicked[i] = !wellBeingTicked[i];
                });
                setWellBeingTicked();
              },
              child: Column(
                children: [
                  SizedBox(
                    height: size.width / 12,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width / 12,
                          child: Icon(
                            wellBeingTicked[i]
                                ? Icons.done_all_rounded
                                : Icons.done_rounded,
                            size: wellBeingTicked[i]
                                ? size.width / 12
                                : size.width / 15,
                            color: wellBeingTicked[i]
                                ? Colors.green
                                : Theme.of(context)
                                    .colorScheme
                                    .onSecondary
                                    .withOpacity(0.3),
                          ),
                        ),
                        SizedBox(width: size.width / 40),
                        Flexible(
                          child: Text(
                            wellbeing[i].toString(),
                            style: TextStyle(
                              fontSize: size.width / 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.01 * size.height),
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
            SizedBox(height: 0.01 * size.height),
            createBaseProgram(context),
            SizedBox(height: size.height / 25),
            Text(
              "Well-Being Section",
              style: TextStyle(
                fontSize: size.width / 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 0.01 * size.height),
            createWellBeing(context),
            /*Text(skill),
            Text(trainingTime.toString()),
            if (skillBaseLists[skill] != null)
              Text(skillBaseLists[skill]!.length.toString()),
            if (skillBaseLists[skill] != null)
              Text(skillBaseLists[skill]![0][0].toString()),
            Text(plan.toString()),
            if (skillBaseLists[skill] != null)
              Text(skillBaseLists[skill]![0][0].toString()),
            if (plan.isNotEmpty) Text(plan[0]),
            Text(day.toString()),
            Text(basePlanTicked.toString()),*/
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
