import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../widgets/BottomNavBarWidget.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
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
            SizedBox(
              height: displayHeight * 0.06,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: displayWidth * 0.05,
                          height: displayWidth * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        Text(
                          "Entregar aqui".toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'BalooBhai',
                            color: Colors.white,
                          ),
                        ),
                      ]
                    ),
                    width: displayWidth * 0.46,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                    ),
                    margin: EdgeInsets.only(
                      right: displayWidth * 0.01,
                    ),
                    padding: EdgeInsets.only(
                      left: displayWidth * 0.03,
                      right: displayWidth * 0.03,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: displayWidth * 0.05,
                          height: displayWidth * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        Text(
                          "Retirar na loja".toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'BalooBhai',
                            color: Colors.white,
                          ),
                        ),
                      ]
                    ),
                    width: displayWidth * 0.46,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                    ),
                    margin: EdgeInsets.only(
                      left: displayWidth * 0.01,
                    ),
                    padding: EdgeInsets.only(
                      left: displayWidth * 0.03,
                      right: displayWidth * 0.03,
                    ),
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
                top: displayHeight * 0.03 ,
              ),
              width: displayWidth * 0.94,
            ),
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
                      top: displayHeight * 0.02,
                      bottom: displayHeight * 0.02,
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
                top: displayHeight * 0.04,
                bottom: displayHeight * 0.04,
              ),
            ),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.yellow,
                      size: 35,
                    ),
                    Text(
                      "ADICIONAR MAIS PRODUTOS",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'BalooBhai',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.001,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border(
                  top: BorderSide(width: 3.0, color: Colors.black),
                  bottom: BorderSide(width: 3.0, color: Colors.black),
                ),
              ),
              width: displayWidth,
              height: displayHeight * 0.06,
            ),
            Container(
              child: Center(
                  child: Text(
                    "ÚLTIMO DESEJO",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'BalooBhai',
                      color: Colors.white,
                    ),
                  )
              ),
              margin: EdgeInsets.only(
                left: displayWidth * 0.15,
                right: displayWidth * 0.15,
                top: displayHeight * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: displayWidth * 0.7,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 0,
              ),
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "BEBIDAS",
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                          size: 35,
                        ),
                      ],
                    ),
                    width: displayWidth * 0.84,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: displayWidth * 0.08,
                      right: displayWidth * 0.01,
                      top: displayHeight * 0.03,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 0,
              ),
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "SOBREMESA",
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                          size: 35,
                        ),
                      ],
                    ),
                    width: displayWidth * 0.94,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                  child: Text(
                    "TUDO CERTO",
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
                top: displayHeight * 0.09,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: displayWidth * 0.94,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
