import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login/globals.dart';

class PasswordRecoveryPage extends StatefulWidget {
  @override
  _PasswordRecoveryPageState createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final formKey = GlobalKey<FormState>();
  final emailAddress = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool buttonEnabled = false;

  Future<void> sendEmail() async {
    print("Email: " + emailAddress.text);
    await auth.sendPasswordResetEmail(email: emailAddress.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: Container(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            onChanged: () => setState(() => buttonEnabled = formKey.currentState.validate()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                Container(
                  child: Text("RECUPERAÇÃO DE SENHA"),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: displayWidth / 10
                  ),
                  child: TextFormField(
                    controller: emailAddress,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value.isEmpty) {
                        return "*Um email é necessário";
                      } else if(!value.isEmail) {
                        return "*Endereço de email inválido";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: displayHeight / 30,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: displayWidth / 10,
                    right: displayWidth / 10,
                    bottom: displayWidth / 12,
                  ),
                  child: RaisedButton(
                    disabledColor: Colors.grey,
                    onPressed: buttonEnabled ? () {
                      // emailAddress.text = "testes.texugo@gmail.com";
                      if(formKey.currentState.validate()) {
                        sendEmail();
                      }
                    } : null,
                    child: Text('ENVIAR EMAIL', style: TextStyle(color: Colors.white, fontSize: 20),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
