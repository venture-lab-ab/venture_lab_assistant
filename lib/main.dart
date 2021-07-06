import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:venture_lab_assistant/HomePage.dart';
import 'Login.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VentureApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Colors.grey.withOpacity(.3),
        indicatorColor: Colors.grey.withOpacity(.3),
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
