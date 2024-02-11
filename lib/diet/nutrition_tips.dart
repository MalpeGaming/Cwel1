import 'package:flutter/material.dart';
import '/navbar.dart';
import '/your_activities.dart';
import 'bmi.dart';
import 'cal_requirements_calc.dart';
import 'brain_supplements.dart';
import 'food_table.dart';

class NutritionTips extends StatefulWidget {
  const NutritionTips({super.key});

  @override
  State<NutritionTips> createState() => _NutritionTips();
}

class _NutritionTips extends State<NutritionTips> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    "NUTRITION",
                    style: TextStyle(
                      fontSize: size.width / 7,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    "TIPS",
                    style: TextStyle(fontSize: size.width / 17),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.05 * size.height),
            createActivity(
              context,
              "diet/bmi",
              "Calculate your BMI.",
              "",
              0.03 * size.height,
              const BMI(),
              zero: 0,
            ),
            createActivity(
              context,
              "diet/calorie_req",
              "Estimate your Calorie Requirements.",
              "",
              0.025 * size.height,
              const CalRequirementsCalc(),
              zero: 0,
            ),
            createActivity(
              context,
              "diet/supplements",
              "What supplements are good for your brain?",
              "",
              0.025 * size.height,
              const BrainSupplements(),
              zero: 0,
            ),
            createActivity(
              context,
              "diet/should_avoid",
              "What should you eat/avoid eating?",
              "",
              0.025 * size.height,
              const FoodTable(),
              zero: 0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
