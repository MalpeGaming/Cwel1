import 'package:brain_train_app/app_bar.dart';
import 'package:flutter/material.dart';

class ActivityLevelList extends StatefulWidget {
  const ActivityLevelList({
    super.key,
    required this.size,
    required this.onOptionSelected,
  });

  final Size size;
  final Function(int?) onOptionSelected;

  @override
  State<ActivityLevelList> createState() => _ActivityLevelList();
}

class _ActivityLevelList extends State<ActivityLevelList> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        createListTitle(0, 'Little/no exercise'),
        createListTitle(1, 'Light exercise/sports 1-3 days a week'),
        createListTitle(2, 'Moderate exercise/sports 3-5 days a week'),
        createListTitle(3, 'Hard exercise/sports 6-7 days a week'),
        createListTitle(4, 'Very hard exercise/sports & physical job'),
      ],
    );
  }

  ListTile createListTitle(int val, String text) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(fontSize: widget.size.width / 18),
      ),
      leading: Radio<int>(
        value: val,
        groupValue: selectedOption,
        activeColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            selectedOption = value;
          });
          widget.onOptionSelected(value);
        },
      ),
    );
  }
}

class CalRequirementsPage extends StatefulWidget {
  const CalRequirementsPage({super.key, required this.cal});

  final int cal;

  @override
  _CalRequirementsPageState createState() => _CalRequirementsPageState();
}

class _CalRequirementsPageState extends State<CalRequirementsPage> {
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CALORIE DAILY REQUIREMENTS",
              style: TextStyle(
                fontSize: size.width / 9.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Text(
              "What is your activity level?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width / 18,
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            ActivityLevelList(
              size: size,
              onOptionSelected: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            SizedBox(
              height: size.height / 20,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: size.width / 18,
                ),
                children: [
                  const TextSpan(
                    text: "You overall need\n",
                  ),
                  TextSpan(
                    text:
                        "${selectedOption > -1 ? ((1.2 + selectedOption * 0.175) * widget.cal).round() : 0}kcal per day",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
