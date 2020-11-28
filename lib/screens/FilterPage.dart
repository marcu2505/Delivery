import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/ui/Layout.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          SizedBox(
            height: displayHeight * 0.04,
          ),
          Center(
            child: Container(
              child: Text(
                "Categorias".toUpperCase(),
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontFamily: 'BalooBhai',
                  fontWeight: FontWeight.w300
                ),
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
              padding: EdgeInsets.only(
                left: displayWidth * 0.05,
                right: displayWidth * 0.05,
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.01,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "Hamburguer".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "Pizza".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "Hamburguer".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "Pizza".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "Hamburguer".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "Pizza".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "Hamburguer".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "Pizza".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "Hamburguer".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "Pizza".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "Hamburguer".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "Pizza".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.4,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "Preço médio".toUpperCase(),
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'BalooBhai',
                    fontWeight: FontWeight.w300
                ),
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.04,
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
              padding: EdgeInsets.only(
                left: displayWidth * 0.05,
                right: displayWidth * 0.05,
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "\$".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.2,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "\$\$".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.2,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "\$\$\$".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.2,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "\$\$\$\$".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.2,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "Cupons".toUpperCase(),
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'BalooBhai',
                    fontWeight: FontWeight.w300
                ),
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.04,
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
              padding: EdgeInsets.only(
                left: displayWidth * 0.05,
                right: displayWidth * 0.05,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "Aceita cupons".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.43,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "Tempo de entrega".toUpperCase(),
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: 'BalooBhai',
                    fontWeight: FontWeight.w300
                ),
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.04,
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
              padding: EdgeInsets.only(
                left: displayWidth * 0.05,
                right: displayWidth * 0.05,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "10-15 minutos".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.42,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "15-30 minutos".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.42,
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              left: displayWidth * 0.075,
              right: displayWidth * 0.075,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                        "30-40 minutos".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.42,
                ),
                Container(
                  child: Center(
                      child: Text(
                        "40-60 minutos".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'BalooBhai',
                          color: Colors.black,
                        ),
                      )
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
                  width: displayWidth * 0.42,
                ),

              ],
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "Filtrar".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'BalooBhai',
                    fontWeight: FontWeight.w300
                ),
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.04,
                bottom: displayHeight * 0.04,
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
              width: displayWidth * 0.94,
            ),
          ),
        ],
      ),
    );
  }
}
