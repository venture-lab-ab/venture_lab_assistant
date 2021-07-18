import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'BottomNaviBar.dart';
import 'FloatingActionButton.dart';
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
  int selectedIndex;
  _HomeState({required this.selectedIndex});

  final PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;


  List screens = [HomeScreen(), InboxScreen(), VentureLabScreen(), NotificationScreen(), AccountScreen(), LoginScreen()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: VLBLUE),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButton(
          controller: pageController,
        ),
        body: PageView(
          //physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          pageSnapping: true,
          onPageChanged: (index){
            setState(() {
              pageIndex = index;
            });
            print(pageIndex);
          },
          children: [
            Container(child: HomeScreen()),
            Container(child: InboxScreen()),
            Container(child: VentureLabScreen()),
            Container(child: NotificationScreen()),
            Container(child: AccountScreen()),
          ],
        ),
        drawer: NaviDrawer(
        ),

        bottomNavigationBar: BottomNaviBar(
          controller: pageController,
        ),

    );
  }

}





