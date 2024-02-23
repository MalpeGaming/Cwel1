import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/navbar.dart';
import '/app_bar.dart';

class CalRequirementsCalc extends StatefulWidget {
  const CalRequirementsCalc({super.key});

  @override
  State<CalRequirementsCalc> createState() => _CalRequirementsCalc();
}

class _CalRequirementsCalc extends State<CalRequirementsCalc> {
  bool onclick = false;
  bool isMan = true;
  int cal = 0;
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  SizedBox buildButton(
    BuildContext context,
    bool pressedNum,
    String text, {
    bool oneOption = false,
    double widthFactor = 0.15,
    bool linked = true,
    bool isGender = false,
  }) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: widthFactor * size.width,
      height: 0.05 * size.height,
      child: OutlinedButton(
        onPressed: () {
          if (linked) onclick = pressedNum;
          if (isGender) isMan = !pressedNum;
          setState(() {
            if (weight.text.isNotEmpty &&
                height.text.isNotEmpty &&
                age.text.isNotEmpty) {
              calcCal(
                double.parse(height.text) / 100.0,
                double.parse(weight.text),
                int.parse(age.text),
              );
            }
          });
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return states.contains(MaterialState.pressed)
                  ? Theme.of(context).colorScheme.secondary
                  : oneOption ||
                          (!isGender && onclick == pressedNum) ||
                          (isGender && !isMan == pressedNum)
                      ? const Color.fromARGB(255, 162, 218, 255)
                      : Theme.of(context).colorScheme.background;
            },
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(8.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 0.045 * size.width),
        ),
      ),
    );
  }

  Column buildQuery(
    BuildContext context,
    String text,
    int hintText,
    String txt1,
    String txt2,
    TextEditingController controller, {
    bool noForm = false,
    double widthFactor = 0.15,
    bool linked = true,
    bool isGender = false,
  }) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != "")
          Text(
            "Please Enter Your $text",
            style: TextStyle(
              fontSize: 0.055 * size.width,
            ),
          ),
        SizedBox(height: 0.007 * size.height),
        Row(
          children: [
            if (!noForm)
              SizedBox(
                width: 0.3 * size.width,
                height: 0.05 * size.height,
                child: TextField(
                  onChanged: (String value) {
                    if (height.text.isNotEmpty &&
                        weight.text.isNotEmpty & age.text.isNotEmpty) {
                      setState(() {
                        calcCal(
                          double.parse(height.text) / 100.0,
                          double.parse(weight.text),
                          int.parse(age.text),
                        );
                      });
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  controller: controller,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size.width / 24),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 0.10 * size.width,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: hintText.toString(),
                    hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            if (!noForm) SizedBox(width: 0.025 * size.width),
            buildButton(
              context,
              false,
              txt1,
              oneOption: txt2 == "" ? true : false,
              widthFactor: widthFactor,
              linked: linked,
              isGender: isGender,
            ),
            SizedBox(width: 0.025 * size.width),
            if (txt2 != "")
              buildButton(
                context,
                true,
                txt2,
                widthFactor: widthFactor,
                linked: linked,
                isGender: isGender,
              ),
          ],
        ),
      ],
    );
  }

  void calcCal(double height, double weight, int age) {
    if (height != 0 && weight != 0) {
      double convHeight = height * 100;
      double convWeight = weight;
      if (onclick) {
        convWeight *= 0.45359237;
        convHeight *= 2.54;
      }
      if (isMan) {
        cal = (66 + 13.7 * convWeight + 5 * convHeight - 6.8 * age).round();
      } else {
        cal = (655 + 9.6 * convWeight + 1.8 * convHeight - 4.7 * age).round();
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ''),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            bottom: size.height / 15,
          ),
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      "CALORIE DAILY REQUIREMENTS",
                      style: TextStyle(
                        fontSize: size.width / 9.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      "The calculator works for adults between the ages of 18-52.",
                      style: TextStyle(fontSize: size.width / 26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width / 15,
                  right: size.width / 15,
                  top: size.height / 25,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildQuery(
                      context,
                      "",
                      34,
                      "Man",
                      "Woman",
                      age,
                      noForm: true,
                      widthFactor: 0.3,
                      linked: false,
                      isGender: true,
                    ),
                    SizedBox(height: 0.01 * size.height),
                    buildQuery(
                      context,
                      "Age",
                      34,
                      "years",
                      "",
                      age,
                      widthFactor: 0.3,
                      linked: false,
                    ),
                    SizedBox(height: 0.01 * size.height),
                    buildQuery(context, "Height", 167, "cm", "in", height),
                    SizedBox(height: 0.01 * size.height),
                    buildQuery(context, "Weight", 56, "kg", "lb", weight),
                    SizedBox(height: 0.03 * size.height),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 0.027 * size.height,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        children: [
                          const TextSpan(text: "Your "),
                          const TextSpan(
                            text: "BASE",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: " calorie requirements are "),
                          TextSpan(
                            text: "${cal}kcal/day",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
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
