import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
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
  final myController = TextEditingController();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginDate = DateTime.now();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> googleLogin() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await auth.signInWithCredential(credential);
  }

  void emailLogin() async {
    try {
      if (environment == "development" && email.text == "" && password.text == "") {
        email.text = "testes.texugo@gmail.com";
        password.text = "batataMagica20";
      }

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text
      );
      if (userCredential.user != null) {
        Get.offAndToNamed('/main');
      }
    } on FirebaseAuthException catch(e) {
      if(e.code == "wrong-password") {
        print("Senha incorreta.");
      } else if(e.code == "user-not-found") {
        print("Usuário não cadastrado ou email incorreto.");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  bool _obscure = true;

  void _togglePassword() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: displayHeight / 10,
              ),
              Container(
                height: displayHeight / 3,
                child: Image(
                  image: AssetImage('assets/img/deliveryRegional.png'),
                  fit: BoxFit.contain,
                  height: displayHeight / 6,
                  width: displayWidth / 2,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: displayWidth / 10
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.person,
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
                margin: EdgeInsets.symmetric(
                    horizontal: displayWidth / 10
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      controller: password,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _togglePassword,
                          child: Icon(
                            _obscure ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        labelText: "Senha",
                        focusColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: displayWidth / 20,
                  top: 2,
                ),
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () => {
                    Get.toNamed('/forgot-password')
                  },
                  child: Text(
                    "Esqueci minha senha",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: displayWidth / 10,
                  right: displayWidth / 10,
                  bottom: displayWidth / 12,
                ),
                height: displayHeight / 18,
                child: RaisedButton(
                  onPressed: (){
                    emailLogin();
                  },
                  child: Text('ENTRAR', style: TextStyle(color: Colors.white, fontSize: 20),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.red,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 1,
                    width: displayWidth / 3,
                    color: Colors.white,
                    margin: EdgeInsets.only(
                      bottom: displayWidth / 18,
                    ),
                  ),
                  Container(
                    child: Text(
                      "OU",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: 5,
                      right: 5,
                      bottom: displayWidth / 18,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: displayWidth / 3,
                    color: Colors.white,
                    margin: EdgeInsets.only(
                      bottom: displayWidth / 18,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    height: 50,
                    width: 50,
                    // margin: EdgeInsets.symmetric(
                    //   horizontal: displayWidth / 35,
                    // ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/google.png'),
                        fit: BoxFit.cover,
                      ),
                      //color: Colors.red,
                    ),
                    child: FlatButton(
                      onPressed: (){
                        googleLogin().then((result) {
                          if (result != null) {
                            Get.offAndToNamed('/main');
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: displayWidth * 0.05,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 50,
                    width: 50,
                    // margin: EdgeInsets.symmetric(
                    //   horizontal: displayWidth / 35,
                    // ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/iconface.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
  //                  margin: EdgeInsets.only(
  //                    top: displayHeight / 40,
  //                  ),
                    alignment: Alignment.topCenter,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Ainda não tem conta? ",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                          TextSpan(
                            text: "Cadastre-se",
                            style: TextStyle(color: Colors.red, fontSize: 17),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Get.toNamed('/signup');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: displayHeight / 9
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
