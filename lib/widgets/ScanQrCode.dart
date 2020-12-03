import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/widgets/Coupon.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ScanQrCode extends StatefulWidget {
  ScanQrCode({Key key}) : super(key: key);

  @override
  _ScanQrCodeState createState() => new _ScanQrCodeState();
}

class CouponTile extends StatelessWidget {
  String cupom;
  String descricao;

  CouponTile(
      {Key key,
        @required this.cupom,
        @required this.descricao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(context, ScaleRoute(page: RestaurantPage()));
      // },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(boxShadow: [
            ]),
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
                  children: [
                    Text(
                      cupom,
                    ),
                    Text(
                      descricao,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CouponList extends StatelessWidget{

  @override

  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('cupons').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("Carregando cupons...");
        return new ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: snapshot.data.docs.map((cupons) {
            if(cupons["cupom"] == qrText){
              print(cupons["descricao"]);
              print(FirebaseAuth.instance.currentUser.uid);
              print(cupons.id);
              // FirebaseFirestore.instance.collection('usuario-cupom').add(
              //   {
              //     'coupon_id': cupons.id,
              //     'user_id': FirebaseAuth.instance.currentUser.uid,
              //   }
              // );
              //Navigator.push(context, ScaleRoute(page: Coupon()));
            }
          }).toList(),
        );
      },
    );
  }
}

final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
var qrText = "";
QRViewController controller;
PageController _pageController;

class _ScanQrCodeState extends State<ScanQrCode> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: <Widget>[
          Container(
            child: Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  bottom: MediaQuery.of(context).size.height * 0.15,
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
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
          CouponList(),
      ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller = controller;
    qrText = "";
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        print(scanData);
        qrText = scanData;
      });
    });
    //CouponList();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}