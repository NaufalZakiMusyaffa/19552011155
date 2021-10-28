import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:naufalzakimusyaffa_19552011155/pages/dashboard.dart';
import 'package:naufalzakimusyaffa_19552011155/pages/date.dart';
import 'package:naufalzakimusyaffa_19552011155/pages/time.dart';

class MenuUtama extends StatefulWidget {
  const MenuUtama({Key? key}) : super(key: key);

  @override
  _MenuUtamaState createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            Dashboard(),
            Date(),
            Time(),
          ],
      )
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.date_range),
            title: Text('Date'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.redAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.timer),
            title: Text('Time'),
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
