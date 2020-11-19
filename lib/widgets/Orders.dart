import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../globals.dart';
import '../widgets/BottomNavBarWidget.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                        "Antigos".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'BalooBhai',
                            fontWeight: FontWeight.w300
                        ),
                        textAlign: TextAlign.center,
                      ),
                      //width: displayWidth * 0.475,
                    ),
                  ),
                  VerticalDivider(
                    thickness: 3,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        "Em andamento".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'BalooBhai',
                            fontWeight: FontWeight.w300
                        ),
                        textAlign: TextAlign.center,
                      ),
                      //width: displayWidth * 0.475,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              width: displayWidth,
              height: displayHeight * 0.075,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "18/08/2020",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    margin: EdgeInsets.only(
                      top: displayHeight * 0.02,
                      bottom: displayHeight * 0.02,
                    ),
                  ),
                  Container(
                    child: Text(
                      "09:31:45",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: displayWidth * 0.02,
                      right: displayWidth * 0.02,
                    ),
                    margin: EdgeInsets.only(
                      left: displayWidth * 0.03,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
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
                            child: Image.network("https://static3.depositphotos.com/1003631/209/i/600/depositphotos_2099183-stock-photo-fine-table-setting-in-gourmet.jpg",
                              height: displayHeight * 0.07,
                              width: displayHeight * 0.07,
                              fit: BoxFit.cover,
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
                                        "Gula Carioca".toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'BalooBhai',
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "ver".toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontFamily: 'BalooBhai',
                                              fontWeight: FontWeight.w300
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          color: Colors.red,
                                        ),
                                        padding: EdgeInsets.only(
                                          left: displayWidth * 0.05,
                                          right: displayWidth * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "#MDJOPI89 - pedido em andamento".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 15,
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
                      Divider(
                        color: Colors.black,
                        thickness: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "4".toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontFamily: 'BalooBhai',
                                              fontWeight: FontWeight.w300
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          color: Colors.red,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: displayWidth * 0.01,
                                      ),
                                      Text(
                                        "X-TUDO".toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontFamily: 'BalooBhai',
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "4".toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontFamily: 'BalooBhai',
                                              fontWeight: FontWeight.w300
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          color: Colors.red,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: displayWidth * 0.01,
                                      ),
                                      Text(
                                        "COCA-COLA LATA".toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontFamily: 'BalooBhai',
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}


