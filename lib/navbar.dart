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
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.onPrimary,
          ],
          tileMode: TileMode.decal,
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.pinkAccent[100],
        unselectedItemColor: Theme.of(context).colorScheme.background,
        items: [
          buildMenuIcon(Icons.sports_basketball, 0, "Activities"),
          buildMenuIcon(Icons.calendar_today_outlined, 1, "Progress"),
          buildMenuIcon(Icons.home_rounded, 2, "Home"),
          buildMenuIcon(Icons.emoji_food_beverage, 3, "Diet"),
          buildMenuIcon(Icons.settings_rounded, 4, "Settings"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem buildMenuIcon(IconData icon, int index, String lab) {
    Size size = MediaQuery.of(context).size;
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Icon(
            icon,
            size: 30,
            color:
                _selectedIndex == index ? Colors.pinkAccent[100] : Colors.white,
          ),
          SizedBox(height: 0.04 * size.height),
          //),
        ],
      ),
      label: lab,
    );
  }
}
