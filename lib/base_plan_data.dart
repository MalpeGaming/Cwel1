import 'dart:async';
import 'package:brain_train_app/widgets/port_home_tasks_widget.dart';
import 'package:brain_train_app/widgets/port_home_tasks_widget_config.dart';
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:intl/intl.dart';
import 'navbar.dart';
import 'activities_for_each_section.dart';
import 'dart:math';
import 'score_n_progress/finish_screen.dart';
import '/memory/faces.dart';
import 'package:brain_train_app/notification.dart';
import 'activities_for_each_section.dart';

class BasePlanData {
  late SharedPreferences prefs;
  String skill = "";
  int trainingTime = 0;
  var rng = Random();
  List<String> plan = [];
  List<String> basePlanTicked = ["0", "0", "0", "0"];
  int day = 1;
  List<bool> wellBeingTicked = [false, false, false, false];
  int points = 0;
  int procent = 0;

  BasePlanData() {
    // readMemory();
  }

  GlobalKey<AnimatedCircularChartState> key =
  GlobalKey<AnimatedCircularChartState>();

  double summ = 100.0;
  double value = 40.0;
  double value2 = 60.0;
  double value3 = 00.0;
  double value32 = 50.0;

  void calcValues() {
    procent = int.parse((points / trainingTime * 100).toStringAsFixed(0));
    if (procent >= 200) {
      value = 100;
      value2 = 0;
      value3 = 100;
    } else {
      value = min(procent.toDouble(), 100);
      value2 = 100 - value;
      value3 = (procent > 100) ? procent % 100 : 0;
    }
    // List<CircularStackEntry> data = _generateChartData();
    // key.currentState!.updateData(data);
  }

  Future<void> calcDay() async {
    DateTime firstDay = DateTime.now();
    DateTime today = DateTime.now();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('beginning_date') != null) {
      firstDay = DateTime.parse(prefs.getString('beginning_date')!);
    }

    day = today.difference(firstDay).inDays + 1;
  }

  Future<void> setWellBeingTicked() async {
    prefs = await SharedPreferences.getInstance();

    List<String> newWellBeingTickedString = ["0", "0", "0", "0"];

    for (int i = 0; i < wellBeingTicked.length; i++) {
      newWellBeingTickedString[i] = (wellBeingTicked[i] ? "1" : "0");
    }
    prefs.setStringList("wellBeingTickedDay$day", newWellBeingTickedString);
  }

  Future<void> getWellBeingTicked() async {
    prefs = await SharedPreferences.getInstance();

    int newPoints = points;

    List<String> newWellBeingTickedString =
        prefs.getStringList('wellBeingTickedDay$day') ?? [];
    List<bool> newWellBeingTicked = [false, false, false, false];

    for (int i = 0; i < newWellBeingTickedString.length; i++) {
      newWellBeingTicked[i] =
      (newWellBeingTickedString[i] == "1" ? true : false);
      if (newWellBeingTicked[i]) {
        newPoints += wellbeingTimes[wellbeing[i]]!;
      }
    }
    if (newWellBeingTicked.isEmpty) {
      newWellBeingTicked = [false, false, false, false];
    }

    wellBeingTicked = newWellBeingTicked;
    points = newPoints;
  }

  var skillBaseList = [
    [Faces, "Faces", 10],
  ];

  Future<void> getSkill() async {
    prefs = await SharedPreferences.getInstance();
    String newSkill = prefs.getString('skill')!;
    int newTrainingTime = prefs.getInt('training_time')!;

    skill = newSkill;
    trainingTime = newTrainingTime;
  }

  Future<void> createPlan() async {
    prefs = await SharedPreferences.getInstance();
    List<String> newPlan = prefs.getStringList("basePlanDay$day") ?? [];
    print("prefs plan: $newPlan");
    if (newPlan.isNotEmpty) {
      plan = newPlan;
      print("set new plan");
      print("poczatek newPlan: $plan");
      return;
    }
    skillBaseList = List.from(skillBaseLists[skill]!);
    print("skillBaseList: $skillBaseList");
    int currentTime = 0;

    if (skill == 'linguistic') {
      int x = rng.nextInt(4);
      if (x == 0) {
        int el = 2;
        newPlan.add(skillBaseList[el].toList()[1].toString());
        currentTime += skillBaseList[el].toList()[2] as int;
        skillBaseList.removeAt(el);
      } else if (x == 1) {
        int el = 3;
        newPlan.add(skillBaseList[el].toList()[1].toString());
        currentTime += skillBaseList[el].toList()[2] as int;
        skillBaseList.removeAt(el);
      }
    }

    while (currentTime < trainingTime) {
      int el = rng.nextInt(skillBaseList.length);
      newPlan.add(skillBaseList[el].toList()[1].toString());
      currentTime += skillBaseList[el].toList()[2] as int;
      skillBaseList.removeAt(el);
    }
    print("newPlan: $newPlan");
    prefs.setStringList("basePlanDay$day", newPlan);
    plan = newPlan;
  }

  Future<void> getBasePlanTicked() async {
    prefs = await SharedPreferences.getInstance();
    List<String> newBasePlanTicked = ["0", "0", "0", "0"];
    int newPoints = points;

    for (int i = 0; i < plan.length; ++i) {
      newBasePlanTicked[i] = prefs.getString("${plan[i]}TickedDay$day") ?? "0";
      if (newBasePlanTicked[i] == "1") {
        newPoints += sectionTimes[plan[i]]!;
      }
    }
    basePlanTicked = newBasePlanTicked;
    points = newPoints;
    calcValues();
  }

  void getPoints() {
    int newPoints = points;
    for (int i = 0; i < wellBeingTicked.length; ++i) {
      if (wellBeingTicked[i]) newPoints += wellbeingTimes[wellbeing[1]]!;
    }
    points = newPoints;
    calcValues();
  }

  Future<void> readMemory() async {
    print("READ MEMORY CALLED");
    await calcDay().then((_) {
      print("day: $day");
      if (day >= 30) {
        // Navigator.pop(context);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const Finish(),
        //   ),
        // );
      }
    });
    await getSkill();
    await getWellBeingTicked();
    await createPlan();
    await getBasePlanTicked();
  }

  Future<void> initState() async {
    print("INIT");
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
    PortHomeTasksWidgetConfig.initialize().then((value) async {
        // callHomeWidgetUpdate();
        });
    });

    await readMemory();
  }

  // Future<void> updatePoints() async {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs.setInt("pointsDay$day", points);
  // }

  // Widget createBaseProgram(
  //     BuildContext context,
  //     ) {
  //   Size size = MediaQuery.of(context).size;
  //   return Column(
  //     children: [
  //       for (int i = 0; i < plan.length; i++)
  //         Column(
  //           children: [
  //             Row(
  //               children: [
  //                 SizedBox(
  //                   width: size.width / 15,
  //                   child: Icon(
  //                     (basePlanTicked[i] == "1")
  //                         ? Icons.done_all
  //                         : Icons.done_rounded,
  //                     size: basePlanTicked[i] == "1"
  //                         ? size.width / 12
  //                         : size.width / 15,
  //                     color: basePlanTicked[i] == "1"
  //                         ? Colors.green
  //                         : Theme.of(context)
  //                         .colorScheme
  //                         .onSecondary
  //                         .withOpacity(0.3),
  //                   ),
  //                 ),
  //                 SizedBox(width: size.width / 40),
  //                 Flexible(
  //                   child: Text(
  //                     "${sectionNames[plan[i]]} - ${sectionTimes[plan[i]]} min",
  //                     style: TextStyle(
  //                       fontSize: size.width / 22,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 0.01 * size.height),
  //           ],
  //         ),
  //     ],
  //   );
  // }


  
}
