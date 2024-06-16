import 'package:flutter/material.dart';
import 'home.dart';
import 'progress.dart';
import 'your_activities.dart';
import 'diet/nutrition_tips.dart';

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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            if (index == 0) {
              return const YourActivities();
            } else if (index == 1) {
              return const Progress();
            } else if (index == 3) {
              return const NutritionTips();
            } else {
              return const Home();
            }
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 12,
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
          backgroundColor: Theme.of(context).colorScheme.background,
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
    print(MediaQuery.of(context).platformBrightness);
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          ImageIcon(
            AssetImage(
              "assets/navbar_icons/${lab.toLowerCase()}_${_selectedIndex == index ? 'on' : 'off'}_l.png",
            ),
            color: Theme.of(context).colorScheme.onPrimary,
            size: _selectedIndex == index ? 36 : 30,
          ),
          SizedBox(height: 0.042 * size.height),
        ],
      ),
      label: lab,
    );
  }
}
