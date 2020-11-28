import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_login/main.dart';
import 'SignUpScreen.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login/globals.dart';


class SignInScreen extends StatefulWidget {
  final PageController controller;
  SignInScreen(this.controller);
  @override
  _SignInScreenState createState() => _SignInScreenState(controller);
}

class _SignInScreenState extends State<SignInScreen> {
  final myController = TextEditingController();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginDate = DateTime.now();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    // await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }

    return null;
  }

  Future <MyApp> signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Signed Out");
    return MyApp();
  }

  void loginWithEmail() async {
    if (environment == "development") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()
        ),
      );
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text
      );
      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage()
          ),
        );
      }
    } on FirebaseAuthException catch(e) {
      if(e.code == "wrong-password") {
        print("Senha incorreta.");
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

  final PageController pageController;
  _SignInScreenState(this.pageController);

  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: SingleChildScrollView( child: Column(
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
              height: displayHeight / 13,
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
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
            ),

            SizedBox(
              height: displayHeight / 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: displayWidth / 10
              ),
              height: displayHeight / 13,
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
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 7), // changes position of shadow
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
                onPressed: () => {},
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),

//            SizedBox(
//              height: displayHeight / 30,
//            ),
            Container(
              margin: EdgeInsets.only(
                left: displayWidth / 10,
                right: displayWidth / 10,
                bottom: displayWidth / 12,
              ),
              height: displayHeight / 18,
              child: RaisedButton(
                onPressed: (){
                  loginWithEmail();
                },
                child: Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 20),),
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
                  //color: Colors.red,
                  child: FlatButton(
                    onPressed: (){
                      signInWithGoogle().then((result) {
                        if (result != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => HomePage()
                            ),
                          );
                        }
                      });
                    },

                    //child: Image.asset('assets/img/google.png'),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/google.png'),
                      fit: BoxFit.cover,
                    ),
                    //color: Colors.red,
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
                    //color: Colors.green,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()
                              ),
                            );
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
