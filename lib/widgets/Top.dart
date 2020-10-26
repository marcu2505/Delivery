import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_login/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Top extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    await Firebase.initializeApp();

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

  Future <MyApp> signOutGoogle() async{
    await googleSignIn.signOut();
    print("User Signed Out");
    return MyApp();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.03,
        top: 10,
        right: MediaQuery.of(context).size.width * 0.03,
        bottom: 10,
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              'assets/img/logo.png',
              width: MediaQuery.of(context).size.width * 0.16,
              height: MediaQuery.of(context).size.width * 0.16,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.56,
                child: Text(
                  "ENTREGAR",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.56,
                child: Text(
                  "Rua Jose Martins, 1068",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: signOutGoogle,
              child: Icon(
                Icons.edit,
                size: MediaQuery.of(context).size.width * 0.08,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),

    );
  }
}
