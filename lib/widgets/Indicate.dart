import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/ui/Layout.dart';

class Indicate extends StatefulWidget {
  @override
  _IndicateState createState() => _IndicateState();
}

class _IndicateState extends State<Indicate> {
  getValues() {
    print(MediaQuery.of(context).viewPadding);
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            //Indique e acumule
            Container(
              child: Text(
                "Indique e acumule".toUpperCase(),
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
            //Titulo
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Indique o Delivery Regional e ".toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'BalooBhai',
                      fontWeight: FontWeight.w300,
                    ),
                    //textAlign: TextAlign.center,
                  ),
                  Text(
                    "GANHE R\$ 5,00".toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontFamily: 'BalooBhai',
                      fontWeight: FontWeight.w300,
                    ),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
              width: displayWidth * 0.96,
              margin: EdgeInsets.only(
                left: displayWidth * 0.02,
                right: displayWidth * 0.02,
                top: displayHeight * 0.05,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.01,
                bottom: displayHeight * 0.01,
              ),
            ),
            //Explicação
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Compartilhe seu código de cupom com os amigos\nque não conhecem o Delivery Regional. Eles\nganham R\$ 5,00 na primeira compra e você, fiel\nescudeiro, também ganha um cupom de R\$ 5,00".toUpperCase(),
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black,
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
                top: displayHeight * 0.05,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.01,
                bottom: displayHeight * 0.01,
              ),
            ),
            //Termos e condições
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Ver termos e condições".toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
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
                top: displayHeight * 0.02,
              ),
              decoration: BoxDecoration(
                //color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.01,
                bottom: displayHeight * 0.01,
              ),
            ),
            //ps
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "PS: INDIQUE VARIOS AMIGOS E ACUMULE MUITOS CUPONS ".toUpperCase(),
                    style: TextStyle(
                      fontSize: 13,
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
                top: displayHeight * 0.05,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.003,
                bottom: displayHeight * 0.003,
              ),
            ),
            //Cupom
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "RITAFACADA-190".toUpperCase(),
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontFamily: 'BalooBhai',
                      fontWeight: FontWeight.w300,
                    ),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
              width: displayWidth * 0.86,
              margin: EdgeInsets.only(
                left: displayWidth * 0.07,
                right: displayWidth * 0.07,
                top: displayHeight * 0.05,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.005,
                bottom: displayHeight * 0.005,
              ),
            ),
            //Valor
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "VOCÊ JÁ GANHOU R\$ 0.00 INDICANDO O DELIVERY REGIONAL".toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
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
                top: displayHeight * 0.02,
              ),
              decoration: BoxDecoration(
                //color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.003,
                bottom: displayHeight * 0.003,
              ),
            ),
            //Compartilhar
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Compartilhar".toUpperCase(),
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
                top: displayHeight * 0.07,
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
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

