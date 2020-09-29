import 'package:flutter/material.dart';
import 'screens/InitScreen.dart';
import 'screens/SignInScreen.dart';
import 'screens/SignUpScreen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        cursorColor: Colors.white,
        primarySwatch: Colors.blue,

      ),
      home: PageView(
        controller: pageController,
        children: <Widget>[
          Scaffold(
            body: SignInScreen(pageController),
          ),
        ],
      ),
    );
  }
}

