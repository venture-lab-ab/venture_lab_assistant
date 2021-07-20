import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Index 0: NewsFeed"),
      ),
    );
  }
}

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Index 1:Messages"),
      ),
    );
  }
}

class VentureLabScreen extends StatelessWidget {
  String _launchUrl = 'https://www.venture-lab.de';
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


  @override
  Container myScrollList(String imageLink, String title, String subtitle,){
    return Container(
      width: 160,
      height: 200,

      child: Card(
        color: Colors.white,
        child: Wrap(
          children: <Widget>[
            Image.network(
              imageLink,
            ),
            Column(children: <Widget>[

              ElevatedButton(
                child:  Text(title),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 30), // double.infinity is the width and 30 is the height
                ),
                onPressed: () {
                  _launchInApp(_launchUrl);
                },
              )
            ]),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1D79FF),
          title: Text("Horizontal Scroll View"),
          centerTitle: true,
        ),
        backgroundColor: Color(0xfffcfcfc),

        body: Container(

          margin: EdgeInsets.symmetric(vertical: 200.0, horizontal: 5.0),
          width: double.infinity,
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              myScrollList("https://www.th-ab.de/fileadmin/dokumente/allgemein/forschungsmarketing/VentureLab-startup-innovation-prototypes-th-Aschaffenburg-UAS.jpg",
                "Visit our Website", 'https://www.venture-lab.de',),
              myScrollList("https://stadt-bremerhaven.de/wp-content/uploads/2017/02/Google-Maps-Banner.jpg",
                "Find us", "GOOGLE MAPS",),
              myScrollList("https://www.pcgames.de/screenshots/original/2011/03/Youtube-Logo1.jpg",
                "Visit our channel", "Colour",),
              myScrollList("https://venture-lab.de/wp-content/uploads/2021/04/VentureLab-Prof-Boris-Bauke-595x400.jpg",
                "sample", "tbd",),
              myScrollList("https://cdn.pixabay.com/photo/2017/02/22/16/50/multnomah-falls-2089902__340.jpg",
                "tbd", "tbd",),
              myScrollList("https://cdn.pixabay.com/photo/2019/04/06/06/44/astronaut-4106766__340.jpg",
                "tbd", "tbd",),
            ],
          ),
        ),
      ),
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