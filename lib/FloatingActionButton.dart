import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final PageController controller;

  FloatingButton({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            controller.animateToPage(2, duration: Duration(seconds: 1), curve: Curves.linear);
            //pageController.animateToPage(2, duration: Duration(milliseconds: 350), curve: Curves.bounceIn);
          },
          child: new Image.asset(
            'images/vllogob.png',
            scale: 5,
          ),
        ),
      ),
    );
  }
}
