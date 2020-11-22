import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/widgets/Indicate.dart';
import '../globals.dart';
import '../widgets/BottomNavBarWidget.dart';
import '../widgets/Indicate.dart';
import '../widgets/Contact.dart';
import '../widgets/Suggest.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  getValues() {
    print(MediaQuery.of(context).viewPadding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
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
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Marcus Rodrigo".toUpperCase(),
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
              ),
              //width: displayWidth * 0.9,
            ),
            //Indique e acumule
            GestureDetector(
              onTap: (){
                Navigator.push(context, ScaleRoute(page: Indicate()));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Indique e acumule".toUpperCase(),
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontFamily: 'BalooBhai',
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      // margin: EdgeInsets.only(
                      //   right: displayWidth * 0.15,
                      // ),
                    ),
                    Container(
                      child: Icon(
                        Icons.card_giftcard,
                        size: 28,
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
                  left: displayWidth * 0.05,
                  right: displayWidth * 0.05,
                ),
                padding: EdgeInsets.only(
                  //bottom: displayHeight * 0.005,
                  top: displayHeight * 0.005,
                  left: displayWidth * 0.03,
                  right: displayWidth * 0.03,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                //width: displayWidth * 0.9,
              ),
            ),
            //Meus endereços
            Container(
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
                      "MEUS ENDEREÇOS".toUpperCase(),
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
                //bottom: displayHeight * 0.005,
                top: displayHeight * 0.005,
                left: displayWidth * 0.01,
                right: displayWidth * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              //width: displayWidth * 0.9,
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
                      "Meus dados".toUpperCase(),
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
                //bottom: displayHeight * 0.005,
                top: displayHeight * 0.005,
                left: displayWidth * 0.01,
                right: displayWidth * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              //width: displayWidth * 0.9,
            ),
            //Cupons de desconto
            Container(
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
                      "Meus Cupons".toUpperCase(),
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
                //bottom: displayHeight * 0.005,
                top: displayHeight * 0.005,
                left: displayWidth * 0.01,
                right: displayWidth * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              //width: displayWidth * 0.9,
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
                      "Seja entregador".toUpperCase(),
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
                //bottom: displayHeight * 0.005,
                top: displayHeight * 0.005,
                left: displayWidth * 0.01,
                right: displayWidth * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              //width: displayWidth * 0.9,
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
                      "Cadastrar estabeleci".toUpperCase(),
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
                //bottom: displayHeight * 0.005,
                top: displayHeight * 0.005,
                left: displayWidth * 0.01,
                right: displayWidth * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              //width: displayWidth * 0.9,
            ),
            //Fale conosco
            GestureDetector(
              onTap: (){
                Navigator.push(context, ScaleRoute(page: Contact()));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Fale conosco".toUpperCase(),
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontFamily: 'BalooBhai',
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      // margin: EdgeInsets.only(
                      //   right: displayWidth * 0.15,
                      // ),
                    ),
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
                  //bottom: displayHeight * 0.005,
                  top: displayHeight * 0.005,
                  left: displayWidth * 0.03,
                  right: displayWidth * 0.03,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                //width: displayWidth * 0.9,
              ),
            ),
            //Sugerir estabelecimento
            GestureDetector(
              onTap: (){
                Navigator.push(context, ScaleRoute(page: Suggest()));
              },
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Sugerir estabeleci".toUpperCase(),
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        // margin: EdgeInsets.only(
                        //   right: displayWidth * 0.15,
                        // ),
                      ),
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
                    //bottom: displayHeight * 0.005,
                    top: displayHeight * 0.005,
                    left: displayWidth * 0.03,
                    right: displayWidth * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  //width: displayWidth * 0.9,
                ),
            ),
            //Sair
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Sair desta conta".toUpperCase(),
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    // margin: EdgeInsets.only(
                    //   right: displayWidth * 0.15,
                    // ),
                  ),
                  Container(
                    child: Icon(
                      Icons.exit_to_app,
                      size: 28,
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
                //bottom: displayHeight * 0.005,
                top: displayHeight * 0.005,
                left: displayWidth * 0.03,
                right: displayWidth * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              //width: displayWidth * 0.9,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

