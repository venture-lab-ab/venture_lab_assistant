import 'package:flutter/material.dart';

const VLBLUE = const Color(0xff1a7aff);

class BottomNaviBar extends StatelessWidget {
  final PageController controller;

  BottomNaviBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.hardEdge,

      shape: CircularNotchedRectangle(),
      child: Container(
        height: 55,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(Icons.home),
              onPressed: () {
                controller.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.linear);
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(Icons.search),
              onPressed: () {
                controller.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.linear);
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(Icons.notifications),
              onPressed: () {
                controller.animateToPage(3, duration: Duration(seconds: 1), curve: Curves.linear);
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(Icons.list),
              onPressed: () {
                controller.animateToPage(4, duration: Duration(seconds: 1), curve: Curves.linear);
              },
            )
          ],
        ),
      ),
    );
  }
}


class BottomNaviBar_1 extends StatelessWidget {
  final PageController controller;

  BottomNaviBar_1({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(

      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      //notchedShape: notchedShape,
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
          label: "",
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
      elevation: 5.0,
      selectedItemColor: Colors.grey,
      //backgroundColor: Colors.purple,
      unselectedItemColor: VLBLUE,
    );
  }
}
