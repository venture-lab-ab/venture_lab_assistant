import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
      initialUrl: 'https://www.instagram.com/venturelabthab/',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
        _controller.complete(controller);
      },
    ));
  }
}

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(""),
      ),
    );
  }
}

class VentureLabScreen extends StatelessWidget {
  @override
  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'could not launch $url';
    }
  }

  Container myScrollList(
    String imageLink,
    String title,
    String subtitle,
  ) {
    return Container(
      width: 160,
      height: 120,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        child: Wrap(
          children: <Widget>[
            Image.asset(
              imageLink,
            ),
            Column(

                children: <Widget>[

              ElevatedButton(
                child: Text(title),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity,
                      50), //// double.infinity is the width and 30 is the height
                  primary: Color(0xffFC696D),

                            ),

                onPressed: () {
                  _launchInApp(subtitle);
                },
              )
            ]),
          ],
        ),
      ),
    );
  }

  final TextEditingController _Textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1D79FF),
          title: Text("VL "),
          centerTitle: true,
        ),
        backgroundColor: Color(0xfffcfcfc),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/vlogo.png"),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(


              children: [
                Container(

                  margin: EdgeInsets.symmetric(vertical: 50, horizontal: 5.0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      myScrollList(
                        "images/1.png",
                        "Visit our Website",
                        'https://www.venture-lab.de',
                      ),
                      myScrollList(
                        "images/2.png",
                        "Find us",
                        'https://www.google.com/maps/place/VentureLab/@49.970567,9.1587735,17z/data=!3m1!4b1!4m5!3m4!1s0x47bd49ce9b7753f1:0x252f1286106e47d7!8m2!3d49.970567!4d9.1609622',
                      ),
                      myScrollList(
                        "images/3.png",
                        "Visit our channel",
                        'https://www.youtube.com/channel/UCAMCv554P5InV7ST7sDhuTg',
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );
                        },
                        child: Text("Testing 2nd Route"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 150, horizontal: 5.0),
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: TextFormField(
                          minLines: 2,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Give us your feedback!',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _Textcontroller.notifyListeners();
                        },
                        child: Text("Send message"),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body:
      WebView(
        initialUrl: 'https://www.venture-lab.de',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller.complete(controller);
        },
      )

    );
  }
}


class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Index 3: Notifications"),
      ),
    );
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Index 4: Account"),
      ),
    );
  }
}
