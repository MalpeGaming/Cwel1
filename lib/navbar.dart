import 'package:flutter/material.dart';
import 'home.dart';
import 'progress.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

int _selectedIndex = 0;

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            if (index == 1) {
              return const Progress();
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
    return SizedBox(
      height: 70.0,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.pinkAccent[100],
        unselectedItemColor: Colors.white,
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
          //CircleAvatar(
          //radius: 25,
          /*backgroundColor: _selectedIndex == index
                ? const Color.fromARGB(255, 251, 128, 255)
                : Colors.white,*/
          //child:
          Icon(
            icon,
            size: 35,
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
