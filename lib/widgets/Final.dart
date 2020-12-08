import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/screens/CouponsPage.dart';
import 'package:flutter_login/widgets/CouponsWidget.dart';
import 'package:flutter_login/widgets/Address.dart';
import 'package:get/get.dart';


class Final extends StatefulWidget {
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
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
            // SizedBox(
            //   height: displayHeight * 0.01,
            // ),
            //onde entregar
            Container(
              child: Text(
                "Finalizar pedidos".toUpperCase(),
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
            //onde entregar
            Container(
              child: Center(
                  child: Text(
                    "ONDE ENTREGAR",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BalooBhai',
                      color: Colors.white,
                    ),
                  )
              ),
              margin: EdgeInsets.only(
                left: displayWidth * 0.2,
                right: displayWidth * 0.2,
                top: displayHeight * 0.03,
                bottom: displayWidth * 0.005,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: displayWidth * 0.6,
            ),
            //endereço
            Container(
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.0),
                ),
                elevation: 1,
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 8,
                    right: 8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: Icon(
                              Icons.local_pizza,
                              size: 50,
                            ),
                          ),
                          SizedBox(
                            width: displayWidth * 0.02,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Casa do mozão".toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'BalooBhai',
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, ScaleRoute(page: Address()));
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.more_vert,
                                            size: 20,
                                          ),
                                          padding: EdgeInsets.only(
                                            left: displayWidth * 0.05,
                                            right: displayWidth * 0.05,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "103 norte alameda 04 lote 2".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'BalooBhai',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //pagamento
            Container(
              child: Center(
                  child: Text(
                    "PAGAMENTO",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BalooBhai',
                      color: Colors.white,
                    ),
                  )
              ),
              margin: EdgeInsets.only(
                left: displayWidth * 0.2,
                right: displayWidth * 0.2,
                top: displayHeight * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: displayWidth * 0.6,
            ),
            //dinheiro
            Container(
              margin: EdgeInsets.only(
                top: 0,
              ),
              padding: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "DINHEIRO",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                    width: displayWidth * 0.74,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: displayWidth * 0.13,
                      right: displayWidth * 0.13,
                      top: displayHeight * 0.005,
                    ),
                  ),
                ],
              ),
            ),
            //cartão
            Container(
              margin: EdgeInsets.only(
                top: 0,
              ),
              padding: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "CARTÃO",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                    width: displayWidth * 0.74,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: displayWidth * 0.13,
                      right: displayWidth * 0.13,
                      top: displayHeight * 0.005,
                    ),
                  ),
                ],
              ),
            ),
            //online
            Container(
              margin: EdgeInsets.only(
                top: 0,
              ),
              padding: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "ONLINE",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                    width: displayWidth * 0.74,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: displayWidth * 0.13,
                      right: displayWidth * 0.13,
                      top: displayHeight * 0.005,
                    ),
                  ),
                ],
              ),
            ),
            //resumo
            Container(
              child: Center(
                  child: Text(
                    "RESUMO",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BalooBhai',
                      color: Colors.white,
                    ),
                  )
              ),
              margin: EdgeInsets.only(
                left: displayWidth * 0.2,
                right: displayWidth * 0.2,
                top: displayHeight * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: displayWidth * 0.6,
            ),
            //produto
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  Container(
                    //color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Bacon ao barbecue",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'BalooBhai',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "R\$ 34.50",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'BalooBhai',
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          padding: EdgeInsets.only(
                            right: displayWidth * 0.01,
                            left: displayWidth * 0.01,
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                      //top: displayHeight * 0.01,
                      //bottom: displayHeight * 0.02,
                    ),
                    width: displayWidth * 0.87,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.only(
                left: displayWidth * 0.03,
                right: displayWidth * 0.03,
                top: displayHeight * 0.02,
              ),
            ),
            //produto
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  Container(
                    //color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Bacon ao barbecue",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'BalooBhai',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "R\$ 34.50",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'BalooBhai',
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          padding: EdgeInsets.only(
                            right: displayWidth * 0.01,
                            left: displayWidth * 0.01,
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                      //top: displayHeight * 0.01,
                      //bottom: displayHeight * 0.02,
                    ),
                    width: displayWidth * 0.87,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.only(
                left: displayWidth * 0.03,
                right: displayWidth * 0.03,
                top: displayHeight * 0.02,
              ),
            ),
            //preços
            Container(
              margin: EdgeInsets.only(
                top: displayHeight * 0.03,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "SUBTOTAL: 60.70",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 3,
                      bottom: 3,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                  ),
                  Container(
                    child: Text(
                      "TAXA DE ENTREGA: 60.70",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 3,
                      bottom: 3,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "DESCONTO: 60.70",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 10,
                          top: 3,
                          bottom: 3,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      Container(
                        child: Text(
                          "TOTAL: 60.70",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          right: 10,
                          top: 3,
                          bottom: 3,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 3, color: Colors.black),
                  bottom: BorderSide(width: 3, color: Colors.black),
                ),
              ),
              width: displayHeight,
            ),
            GestureDetector(
              onTap: (){
                Get.to(CouponsPage(clickable: true));
              },
              child: Container(
                child: Center(
                    child: Text(
                      "FAZER PEDIDO",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'BalooBhai',
                        color: Colors.white,
                      ),
                    )
                ),
                margin: EdgeInsets.only(
                  left: displayWidth * 0.03,
                  right: displayWidth * 0.03,
                  top: displayHeight * 0.03,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: displayWidth * 0.94,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
