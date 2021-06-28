import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:venture_lab_assistant/main.dart';
import 'dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

const users = const {
  'abc@gmail.com': 'abc',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2);

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> _createAuth(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: data.name, password: data.password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          return "Dein PW ist zu schwach!";
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          return "Account existiert bereits!";
        } else {
          printsth();
          return null;
        }
      } catch (e) {
        print(e);
      }
    });
  }

  Future<String?> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: data.name, password: data.password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          return "Error";
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          return "passworterror";
        } else {
          return null;
        }
      }
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "Huch";
    });
  }

  void printsth() {
    print('End - Creation/Signing');
  }

  static const logopath = 'images/vlogo.png';

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'VentureApp',
      logo: logopath,
      onLogin: _authUser,
      onSignup: _createAuth,
      onSubmitAnimationCompleted: () {
        print('Navigator');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: "Test")),
        );
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
