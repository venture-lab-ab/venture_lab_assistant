import 'package:flutter/material.dart';

class BottomNaviBar extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;
  BottomNaviBar({this.selectedIndex, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: new Image.asset(
            'images/vllogob.png',
            scale: 5,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'Account',
        )
      ],
      currentIndex: selectedIndex,
      onTap: onClicked,
      selectedItemColor: Colors.grey,
      //backgroundColor: Colors.purple,
      unselectedItemColor: Colors.purple,
    );
  }
}
