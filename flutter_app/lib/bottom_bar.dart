import 'package:flutter/material.dart';
import 'package:practice3/pages/profile_button.dart';
import 'package:practice3/pages/home_page.dart';
import 'package:practice3/pages/add_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  static final _screens = [
    HomePage(),
    const AddTodoButton(),
    const ProfileButton()
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'TODO追加'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'プロフィール')
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
