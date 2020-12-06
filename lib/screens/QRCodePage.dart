import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/ui/Layout.dart';


class QRCodePage extends StatefulWidget {
  QRCodePage({Key key}) : super(key: key);

  @override
  _QRCodePageState createState() => new _QRCodePageState();
}


class _QRCodePageState extends State<QRCodePage> {
  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: Column(
        children: <Widget>[
          Container(
            child: Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(
                  top: displayHeight * 0.15,
                  bottom: displayHeight * 0.15,
                  left: displayWidth * 0.1,
                  right: displayWidth * 0.1,
                ),
                child: Container(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Text(
                "Leia o qr code que encontrar e ganhe cupons incríveis.",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                    fontFamily: 'BalooBhai',
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}