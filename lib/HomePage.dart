import 'package:flutter/material.dart';
import 'BottomNaviBar.dart';
import 'Screens.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List screens = [HomeScreen(), InboxScreen(), VentureLabScreen(), NotificationScreen(), AccountScreen()];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text('VentureLab'),
          backgroundColor: Colors.blue,
        ),*/
        body: Center(
          child: screens.elementAt(selectedIndex),
        ),
        //drawer: SideMenu(),
        bottomNavigationBar: BottomNaviBar(
          selectedIndex: selectedIndex,
          onClicked: onClicked,
        ));
  }
}





