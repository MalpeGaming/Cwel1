import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 0,
        items: [
          buildMenuIcon(Icons.sports_basketball, 0),
          buildMenuIcon(Icons.calendar_today_outlined, 1),
          buildMenuIcon(Icons.home_rounded, 2),
          buildMenuIcon(Icons.emoji_food_beverage, 3),
          buildMenuIcon(Icons.settings_rounded, 4),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem buildMenuIcon(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: _selectedIndex == index
                ? const Color.fromARGB(255, 251, 128, 255)
                : Colors.white,
            child: Icon(
              icon,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      label: '',
    );
  }
}
