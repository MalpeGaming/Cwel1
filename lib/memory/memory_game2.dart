import 'package:flutter/material.dart';
import '../your_activities.dart';
import '../app_bar.dart';

class MemoryGame2 extends StatefulWidget {
  const MemoryGame2({super.key});
  @override
  State<MemoryGame2> createState() => _MemoryGame2();
}

class _MemoryGame2 extends State<MemoryGame2> {
  List<int> order = [];
  List<bool> tapped = List<bool>.generate(14, (index) => false);
  List<bool> blocked = List<bool>.generate(14, (index) => false);

  int? firstTapped;
  int? secondTapped;

  @override
  void initState() {
    super.initState();
    tapped[1] = true;

    order = [];
    for (int i = 1; i <= 7; ++i) {
      order.addAll([i, i]);
    }
    order.shuffle();
  }

  InkWell card(BuildContext context, int no) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        if (!blocked[no]) {
          setState(
            () {
              if (firstTapped == null) {
                firstTapped = no;
              } else if (firstTapped != null && secondTapped == null) {
                secondTapped = no;
                if (order[firstTapped!] == order[secondTapped!]) {
                  blocked[firstTapped!] = true;
                  blocked[secondTapped!] = true;
                  if (!blocked.contains(false)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const YourActivities(),
                      ),
                    );
                  }
                }
              } else if (firstTapped != null && secondTapped != null) {
                secondTapped = null;
                firstTapped = no;
              }
            },
          );
        }
      },
      child: (firstTapped != no && secondTapped != no)
          ? Container(
              height: 0.25 * size.width,
              width: 0.25 * size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: (blocked[no])
                    ? Theme.of(context).colorScheme.background
                    : const Color.fromARGB(255, 127, 198, 255),
              ),
            )
          : SizedBox(
              height: 0.25 * size.width,
              width: 0.25 * size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/memory/memory_game/cats/${order[no]}.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }

  Row createRow(BuildContext context, int numberOfFirst, int howMany) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        card(context, numberOfFirst),
        SizedBox(width: 0.03 * size.width),
        card(context, numberOfFirst + 1),
        if (howMany == 3) SizedBox(width: 0.03 * size.width),
        if (howMany == 3) card(context, numberOfFirst + 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
          bottom: size.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 0.03 * size.width),
            createRow(context, 0, 3),
            SizedBox(height: 0.03 * size.width),
            createRow(context, 3, 3),
            SizedBox(height: 0.03 * size.width),
            createRow(context, 6, 3),
            SizedBox(height: 0.03 * size.width),
            createRow(context, 9, 3),
            SizedBox(height: 0.03 * size.width),
            createRow(context, 12, 2),
          ],
        ),
      ),
    );
  }
}
