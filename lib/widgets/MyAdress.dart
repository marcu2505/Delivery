import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import '../globals.dart';
import '../widgets/BottomNavBarWidget.dart';
import '../widgets/Coupon.dart';
import '../widgets/Adress.dart';


class MyAdress extends StatefulWidget {
  @override
  _MyAdressState createState() => _MyAdressState();
}

class _MyAdressState extends State<MyAdress> {
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
                "Meus endereços".toUpperCase(),
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
            //endereço
            Container(
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.0),
                ),
                elevation: 1,
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: displayHeight * 0.03,
                  bottom: 5,
                ),
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
                                          Navigator.push(context, ScaleRoute(page: Adress()));
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
                                          Navigator.push(context, ScaleRoute(page: Adress()));
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
                                          Navigator.push(context, ScaleRoute(page: Adress()));
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
                                          Navigator.push(context, ScaleRoute(page: Adress()));
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
                                          Navigator.push(context, ScaleRoute(page: Adress()));
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
            GestureDetector(
              onTap: (){
                Navigator.push(context, ScaleRoute(page: Adress()));
              },
              child: Container(
                child: Center(
                    child: Text(
                      "novo endereço".toUpperCase(),
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
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
