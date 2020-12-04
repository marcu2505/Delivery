import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      var result = await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).get();
      if (result != null && result.data() != null) {
        int signUpStep = result.data()["etapa_cadastro"];
        switch (signUpStep) {
          case 4:
            Get.offAndToNamed('/main');
            break;

          default:
            Get.offAndToNamed('/login');
            break;
        }

        return;
      }

      FirebaseFirestore.instance.collection('usuarios').doc(user.uid).set({
        "id": user.uid,
        "etapa_cadastro": 1,
      });
    }

    Get.offAndToNamed('/login');
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
