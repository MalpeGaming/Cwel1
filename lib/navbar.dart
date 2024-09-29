import 'package:flutter/material.dart';
import 'home.dart';
import 'score_n_progress/progress.dart';
import 'your_activities.dart';
import 'diet/nutrition_tips.dart';
import 'settings/settings.dart';
import 'package:page_transition/page_transition.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

int _selectedIndex = 2;

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: () {
            if (index == 0) {
              return const YourActivities();
            } else if (index == 1) {
              return const Progress();
            } else if (index == 3) {
              return const NutritionTips();
            } else if (index == 4) {
              return const Settings();
            } else {
              return const Home();
            }
          }(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 11,
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 2,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedFontSize: 13,
          unselectedFontSize: 12,
          unselectedItemColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          items: [
            buildMenuIcon(0, "Activities"),
            buildMenuIcon(1, "Progress"),
            buildMenuIcon(2, "Home"),
            buildMenuIcon(3, "Diet"),
            buildMenuIcon(4, "Settings"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  BottomNavigationBarItem buildMenuIcon(int index, String lab) {
    Size size = MediaQuery.of(context).size;
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          ImageIcon(
            AssetImage(
              "assets/navbar_icons/${lab.toLowerCase()}_${_selectedIndex == index ? 'on' : 'off'}_l.png",
            ),
            color: Theme.of(context).colorScheme.onPrimary,
            size: _selectedIndex == index ? 38 : 32,
          ),
          SizedBox(height: 0.042 * size.height),
        ],
      ),
      label: lab,
    );
  }
}
