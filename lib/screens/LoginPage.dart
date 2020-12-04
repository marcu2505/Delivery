import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_login/dialog.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login/globals.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void googleLogin() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await auth.signInWithCredential(credential);
    var user = userCredential.user;
    if(user != null) {
      var result = await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).get();
      if(result != null && result.data() != null) {
        int signUpStep = result.data()["etapa_cadastro"];
        switch(signUpStep) {
          case 2:
            showMessageDialog(context: context, message: "Conclua seu cadastro");
            Get.offAndToNamed('/extra-data');
            break;

          case 3:
            showMessageDialog(context: context, message: "Detectamos que seu cadastro não foi concluído", detail: "Etapa atual: Registro e Verificação de Celular");
            Get.offAndToNamed('/cellphone-registration');
            break;

          case 4:
            Get.offAndToNamed('/main');
            break;
        }

        return;
      }

      FirebaseFirestore.instance.collection('usuarios').doc(user.uid).set({
        "id": user.uid,
        "etapa_cadastro": 2,
      });
      Get.offAndToNamed('/extra-data');
    } else {
      showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
      Get.toNamed('/login');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            height: displayHeight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: displayHeight / 10,
                ),
                // LOGO
                Container(
                  height: displayHeight / 3,
                  child: Image(
                    image: AssetImage('assets/img/deliveryRegional.png'),
                    fit: BoxFit.contain,
                    height: displayHeight / 6,
                    width: displayWidth / 2,
                  ),
                ),
                Spacer(),
                //Login com Google
                Container(
                  margin: EdgeInsets.only(
                    left: displayWidth / 10,
                    right: displayWidth / 10,
                    bottom: displayWidth / 12,
                  ),
                  height: 40,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    onPressed: googleLogin,
                    child: Row(
                      children: [
                        Container(
                          height: 18.0,
                          width: 18.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/button/logo-google.png'),
                              height: 18.0,
                              width: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 24),
                        Text(
                          'Entrar com o Google',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: "Roboto-Medium",
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Login com Email
                Container(
                  margin: EdgeInsets.only(
                    left: displayWidth / 10,
                    right: displayWidth / 10,
                    bottom: 12,
                  ),
                  height: 40,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.red,
                    onPressed: () {
                      Get.toNamed('/email-login-signup');
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 18.0,
                          width: 18.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 24),
                        Text(
                          'Entrar com Email',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: "Roboto-Medium",
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight / 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
