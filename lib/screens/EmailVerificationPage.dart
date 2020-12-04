import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/dialog.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/globals.dart';

class EmailVerificationPage extends StatefulWidget {
  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Timer timer;

  void checkVerifiedEmail() async {
    var user = auth.currentUser;
    if(user != null) {
      user.sendEmailVerification();
      timer = Timer.periodic(Duration(seconds: 5), (timer) async {
        await auth.currentUser.reload();
        user = auth.currentUser;
        if(user.emailVerified) {
          timer.cancel();
          FirebaseFirestore.instance.collection('usuarios').doc(user.uid).update({
            "etapa_cadastro": 2,
          });
          Get.offAndToNamed('/extra-data');
        }
      });
    } else {
      showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
      Get.toNamed('/email-login-signup');
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    checkVerifiedEmail();
    return Layout.render(
      content: Container(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: displayHeight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                // Botão de Retorno
                Container(
                  margin: EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 40,
                      ),
                    )
                  ),
                ),
                // Título
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: displayWidth / 15,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "VERIFIQUE SEU EMAIL",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'BalooBhai',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                // Email
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: displayWidth / 15,
                    vertical: 12,
                  ),
                  child: Text(
                    "Precisamos que você entre em um link que enviamos para o seu email, "
                    "após isso basta voltar ao aplicativo e continuar seu cadastro. "
                    "O email pode demorar até 5 minutos para chegar.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
