import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../navbar.dart';

class CalRequirementsCalc extends StatefulWidget {
  const CalRequirementsCalc({super.key});

  @override
  State<CalRequirementsCalc> createState() => _CalRequirementsCalc();
}

class _CalRequirementsCalc extends State<CalRequirementsCalc> {
  bool onclick = false;
  bool clickedGender = false;
  int cal = 0;
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  SizedBox buildButton(BuildContext context, bool pressedNum, String text,
      {bool oneOption = false, double widthFactor = 0.15, bool linked = true}) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: widthFactor * size.width,
      height: 0.05 * size.height,
      child: OutlinedButton(
        onPressed: () {
          if (linked) onclick = pressedNum;
          if (height.text.isNotEmpty &&
              weight.text.isNotEmpty &&
              age.text.isNotEmpty) {
            setState(() {
              if (weight.text.isNotEmpty && height.text.isNotEmpty) {
                calcCal(int.parse(height.text) / 100.0, int.parse(weight.text));
              }
            });
          }
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
                  : onclick == pressedNum || oneOption
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

  Column buildQuery(BuildContext context, String text, int hintText,
      String txt1, String txt2, TextEditingController controller,
      {bool noForm = false, double widthFactor = 0.15, bool linked = true}) {
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
                    if (height.text.isNotEmpty && weight.text.isNotEmpty) {
                      setState(() {
                        calcCal(int.parse(height.text) / 100.0,
                            int.parse(weight.text));
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
                  ),
                ),
              ),
            if (!noForm) SizedBox(width: 0.025 * size.width),
            buildButton(context, false, txt1,
                oneOption: txt2 == "" ? true : false,
                widthFactor: widthFactor,
                linked: linked),
            SizedBox(width: 0.025 * size.width),
            if (txt2 != "")
              buildButton(context, true, txt2,
                  widthFactor: widthFactor, linked: linked),
          ],
        ),
      ],
    );
  }

  void calcCal(double height, int weight) {
    if (height != 0 && weight != 0) {
      double h = height.toDouble();
      double w = weight.toDouble();
      if (!onclick) cal = (w / (h * h)).round();
      if (onclick) cal = (w * 703 / (h * 100 * h * 100)).round();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                      "CALORIE DAILY REQUIREMENTS",
                      style: TextStyle(
                        fontSize: size.width / 8.5,
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
              SizedBox(height: 0.03 * size.height),
              buildQuery(context, "", 34, "Man", "Woman", age,
                  noForm: true, widthFactor: 0.3, linked: false),
              SizedBox(height: 0.01 * size.height),
              buildQuery(context, "Age", 34, "years", "", age,
                  widthFactor: 0.3, linked: false),
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
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: " calorie requirements are "),
                  TextSpan(
                      text: "${cal}kcal/day",
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ],
              )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
