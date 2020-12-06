import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/screens/CouponsPage.dart';
import 'package:flutter_login/widgets/Indicate.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/widgets/Contact.dart';
import 'package:flutter_login/widgets/Suggest.dart';
import 'package:flutter_login/widgets/QRCodePage.dart';
import 'package:flutter_login/widgets/MyAdress.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    print(FirebaseAuth.instance.currentUser.toString());
    Get.offNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          //Foto e nome
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: displayHeight * 0.07,
                  height: displayHeight * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Center(
                      child: Image.network(
                        FirebaseAuth.instance.currentUser.photoURL != null ? FirebaseAuth.instance.currentUser.photoURL : "https://icon-library.com/images/default-profile-icon/default-profile-icon-16.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    FirebaseAuth.instance.currentUser.displayName != null ? FirebaseAuth.instance.currentUser.displayName.toUpperCase() : "",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'BalooBhai',
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.05,
              right: displayWidth * 0.05,
            ),
            padding: EdgeInsets.only(
              bottom: displayHeight * 0.005,
              top: displayHeight * 0.005,
              left: displayWidth * 0.08,
              right: displayWidth * 0.08,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
          ),
          //Indique e acumule
          GestureDetector(
            onTap: (){
              // Trocar
              Navigator.push(context, ScaleRoute(page: Indicate()));
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "INDIQUE E ACUMULE",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.02,
                left: displayWidth * 0.05,
                right: displayWidth * 0.05,
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.005,
                left: displayWidth * 0.03,
                right: displayWidth * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          //Meus endereços
          GestureDetector(
            onTap: (){
              Navigator.push(context, ScaleRoute(page: MyAdress()));
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.local_pizza,
                      size: 28,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      bottom: displayHeight * 0.01,
                      right: displayWidth * 0.02,
                    ),
                  ),
                  Container(
                    child: Text(
                      "MEUS ENDEREÇOS",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.05,
                left: displayWidth * 0.05,
                right: displayWidth * 0.05,
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.005,
                left: displayWidth * 0.01,
                right: displayWidth * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          //Meus dados
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.account_circle,
                    size: 28,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    bottom: displayHeight * 0.01,
                    right: displayWidth * 0.02,
                  ),
                ),
                Container(
                  child: Text(
                    "MEUS DADOS",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'BalooBhai',
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.05,
              right: displayWidth * 0.05,
            ),
            padding: EdgeInsets.only(
              top: displayHeight * 0.005,
              left: displayWidth * 0.01,
              right: displayWidth * 0.01,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
          ),
          // Leitor QRCode
          GestureDetector(
            onTap: () {
              Get.to(QRCodePage());
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.tablet_android,
                      size: 28,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      bottom: displayHeight * 0.01,
                      right: displayWidth * 0.02,
                    ),
                  ),
                  Container(
                    child: Text(
                      "LEITOR QR CODE",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.02,
                left: displayWidth * 0.05,
                right: displayWidth * 0.05,
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.005,
                left: displayWidth * 0.01,
                right: displayWidth * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          //Cupons de desconto
          GestureDetector(
            onTap: (){
              Get.to(CouponsPage(clickable: false));
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.keyboard,
                      size: 28,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      bottom: displayHeight * 0.01,
                      right: displayWidth * 0.02,
                    ),
                  ),
                  Container(
                    child: Text(
                      "MEUS CUPONS",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.02,
                left: displayWidth * 0.05,
                right: displayWidth * 0.05,
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.005,
                left: displayWidth * 0.01,
                right: displayWidth * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          //Seja um entregador
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.motorcycle,
                    size: 28,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    bottom: displayHeight * 0.01,
                    right: displayWidth * 0.02,
                  ),
                ),
                Container(
                  child: Text(
                    "SEJA ENTREGADOR",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontFamily: 'BalooBhai',
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: displayHeight * 0.05,
              left: displayWidth * 0.05,
              right: displayWidth * 0.05,
            ),
            padding: EdgeInsets.only(
              top: displayHeight * 0.005,
              left: displayWidth * 0.01,
              right: displayWidth * 0.01,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
          ),
          //Indicar estabelecimento
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.store_mall_directory,
                    size: 28,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    bottom: displayHeight * 0.01,
                    right: displayWidth * 0.02,
                  ),
                ),
                Container(
                  child: Text(
                    "CADASTRAR ESTABELECIMENTO",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontFamily: 'BalooBhai',
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.05,
              right: displayWidth * 0.05,
            ),
            padding: EdgeInsets.only(
              top: displayHeight * 0.005,
              left: displayWidth * 0.01,
              right: displayWidth * 0.01,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
          ),
          //Fale conosco
          GestureDetector(
            onTap: (){
              Navigator.push(context, ScaleRoute(page: Contact()));
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.phone,
                      size: 28,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      bottom: displayHeight * 0.01,
                      right: displayWidth * 0.02,
                    ),
                  ),
                  Container(
                    child: Text(
                      "FALE CONOSCO",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.05,
                left: displayWidth * 0.05,
                right: displayWidth * 0.05,
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.005,
                left: displayWidth * 0.01,
                right: displayWidth * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          //Sugerir estabelecimento
          GestureDetector(
            onTap: (){
              Navigator.push(context, ScaleRoute(page: Suggest()));
            },
            child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.store,
                        size: 28,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        bottom: displayHeight * 0.01,
                        right: displayWidth * 0.02,
                      ),
                    ),
                    Container(
                      child: Text(
                        "SUGERIR ESTABELECIMENTO",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontFamily: 'BalooBhai',
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(
                  top: displayHeight * 0.05,
                  left: displayWidth * 0.05,
                  right: displayWidth * 0.05,
                ),
                padding: EdgeInsets.only(
                  top: displayHeight * 0.005,
                  left: displayWidth * 0.01,
                  right: displayWidth * 0.01,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
              ),
          ),
          //Sair
          GestureDetector(
            onTap: logout,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      "SAIR DESTA CONTA",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.exit_to_app,
                      size: 28,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      bottom: displayHeight * 0.01,
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.02,
                left: displayWidth * 0.15,
                right: displayWidth * 0.15,
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.005,
                left: displayWidth * 0.03,
                right: displayWidth * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
        ],
      ),
    );
  }
}

