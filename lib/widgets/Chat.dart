import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../widgets/BottomNavBarWidget.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
            //Fale conosco
            Container(
              child: Text(
                "Fale com o entregador".toUpperCase(),
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontFamily: 'BalooBhai',
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              width: displayWidth,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.01,
                bottom: displayHeight * 0.01,
              ),
            ),
            //Mensagem 1
            Container(
              child: Text(
                "PODE ME PASSAR UM PONTO DE\nREFERENCIA?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'BalooBhai',
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.left,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.05,
                right: displayWidth * 0.15,
              ),
              padding: EdgeInsets.only(
                left: displayWidth * 0.03,
              ),
              width: displayWidth * 0.77,
            ),
            //Mensagem 2
            Container(
              child: Text(
                "CASA AMARELA, AO LADO DA\nESCOLINHA DO FLAMENGO",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'BalooBhai',
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.left,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.03,
                left: displayWidth * 0.15,
              ),
              padding: EdgeInsets.only(
                left: displayWidth * 0.03,
                right: displayWidth * 0.03,
              ),
              width: displayWidth * 0.77,
            ),
            //Compartilhar
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Enviar mensagem".toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'BalooBhai',
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              width: displayWidth * 0.96,
              margin: EdgeInsets.only(
                left: displayWidth * 0.02,
                right: displayWidth * 0.02,
                top: displayHeight * 0.5,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.003,
                bottom: displayHeight * 0.003,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

