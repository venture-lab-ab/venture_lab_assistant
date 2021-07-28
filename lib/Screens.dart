import 'package:flutter/cupertino.dart';
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
          children: <Widget> [

          Container(


          decoration: new BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/vlogo.png"),
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
      ),



          Container(
          margin: EdgeInsets.symmetric(vertical: 200.0, horizontal: 5.0),
          width: double.infinity,
          height: 140,

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              myScrollList("https://www.th-ab.de/fileadmin/dokumente/allgemein/forschungsmarketing/VentureLab-startup-innovation-prototypes-th-Aschaffenburg-UAS.jpg",
                "Visit our Website", 'https://www.venture-lab.de',),
              myScrollList("https://stadt-bremerhaven.de/wp-content/uploads/2017/02/Google-Maps-Banner.jpg",
                "Find us", 'https://www.google.com/maps/place/VentureLab/@49.970567,9.1587735,17z/data=!3m1!4b1!4m5!3m4!1s0x47bd49ce9b7753f1:0x252f1286106e47d7!8m2!3d49.970567!4d9.1609622',),
              myScrollList("https://www.pcgames.de/screenshots/original/2011/03/Youtube-Logo1.jpg",
                "Visit our channel", 'https://www.youtube.com/channel/UCAMCv554P5InV7ST7sDhuTg',),

            ],

          ),
        ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [

                Text ('Help us  improve!'),
                (_Textcontroller.value.text.isEmpty) ? Text("Please enter your message") : Text("Sent Message: ${_Textcontroller.value.text}"),
                Padding(
                  padding:const EdgeInsets.all(10.0),
                   child: TextFormField(
                  minLines:2,
                  maxLines:5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:Colors.white,
                    hintText: 'Give us your feedback!',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),

    ),
                ElevatedButton(
                  onPressed: () {


                      _Textcontroller.notifyListeners();



                  },child: Text("Send message"),)
              ],

            ),
      ],
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