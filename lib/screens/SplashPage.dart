import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    startTimeout();
  }

  startTimeout() async {
    return Timer(Duration(milliseconds: 500), openApp);
  }

  openApp() async {
    var user = FirebaseAuth.instance.currentUser;

    if(user != null) {
      Get.offNamed('/main');
    } else {
      Get.offNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    displayWidth = MediaQuery.of(context).size.width;
    return Layout.render(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(width: 2.0),
            Container(
              alignment: Alignment.center,
              width: 50,
              child: Image.asset(
                'assets/img/logo.png',
                fit: BoxFit.contain,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
