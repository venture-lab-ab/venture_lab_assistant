import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venture_lab_assistant/HomePage.dart';

import 'Login.dart';

const VLBLUE = const Color(0xff1a7aff);
const VLSALMON = const Color(0xfffe6a6a);
const VLPURPLE = const Color(0xffa836f6);

class NaviDrawer extends StatelessWidget {

  final padding = EdgeInsets.symmetric(horizontal: 20);
  final PageController controller;

  NaviDrawer({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final name = 'Markus Flagner';
    final email = 'markus.flager@venture-lab.de';
    final image = null;

    return Drawer(
      elevation: 5.0,
      child: Material(
        color: VLBLUE,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10),
            _createHeader(
              name: name,
              email: email,
              image: image,
              onClicked: () => controller.animateToPage(4, duration: Duration(seconds: 1), curve: Curves.ease),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  _createDrawerItem(
                    icon: Icons.home,
                    text: 'Home',
                    onClicked: () => controller.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.ease),
                  ),
                  const SizedBox(height: 16),
                  _createDrawerItem(
                    icon: Icons.inbox,
                    text: 'Inbox',
                    onClicked: () => controller.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.ease),
                  ),
                  const SizedBox(height: 16),
                  _createDrawerItem(
                    icon: Icons.notifications,
                    text: 'Notifications',
                    onClicked: () => controller.animateToPage(3, duration: Duration(seconds: 1), curve: Curves.ease),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white,),
                  const SizedBox(height: 24),
                  _createDrawerItem(
                    icon: Icons.settings,
                    text: 'Settings',
                    onClicked: () => controller.animateToPage(4, duration: Duration(seconds: 1), curve: Curves.ease),
                  ),
                  const SizedBox(height: 16),
                  _createDrawerItem(
                    icon: Icons.exit_to_app,
                    text: 'Log out',
                    onClicked: () => controller.animateToPage(3, duration: Duration(seconds: 1), curve: Curves.ease),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _createHeader({
    required String name,
    required String email,
    required ImageProvider<Object>? image,
    required VoidCallback onClicked,
  }) {
    final color = Colors.white;

    return InkWell(
        onTap: onClicked,
        child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: VLSALMON,
                  foregroundImage: image,
                  child: new Text("MF"),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 16, color: color),
                    ),
                    Text(
                      email,
                      style: TextStyle(fontSize: 10, color: color),
                    )
                  ],
                )
              ],
            )
        )
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onClicked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color),),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(selectedIndex: 0),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(selectedIndex: 1),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(selectedIndex: 2),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(selectedIndex: 3),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(selectedIndex: 4),
        ));
        break;
      case 5:
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
        break;
    }
  }

}
