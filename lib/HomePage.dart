import 'package:flutter/material.dart';
import 'BottomNaviBar.dart';
import 'Login.dart';
import 'NavigationDrawer.dart';
import 'Screens.dart';

const VLBLUE = const Color(0xff1a7aff);
const VLSALMON = const Color(0xfffe6a6a);
const VLPURPLE = const Color(0xffa836f6);

class Home extends StatefulWidget {
  Home({required this.selectedIndex});
  final int selectedIndex;

  @override
  _HomeState createState() => _HomeState(selectedIndex: selectedIndex);
}

class _HomeState extends State<Home> {
  _HomeState({required this.selectedIndex});
  int selectedIndex;

  List screens = [HomeScreen(), InboxScreen(), VentureLabScreen(), NotificationScreen(), AccountScreen(), LoginScreen()];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: VLBLUE),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: screens.elementAt(selectedIndex),
        ),
        drawer: NaviDrawer(
        ),
        bottomNavigationBar: BottomNaviBar(
          selectedIndex: selectedIndex,
          onClicked: onClicked,
        ),
    );
  }

}





