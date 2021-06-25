

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:venture_lab_assistant/main.dart';
import 'dashboard_screen.dart';

const users = const {
  'abc@gmail.com': 'abc',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2);

  Future<String?> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      printsth();
      return null;
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

  void printsth(){
    print('Test');
  }

  static const logopath = 'images/vlogo.png';



  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'VentureApp',
      logo: logopath,
      onLogin: _authUser,
      onSignup: _authUser,

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



