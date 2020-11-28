import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/globals.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCode extends StatefulWidget {
  ScanQrCode({Key key}) : super(key: key);

  @override
  _ScanQrCodeState createState() => new _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Scan result: $qrText'),
            ),
          )
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     //key: _scaffoldKey,
  //     body: SingleChildScrollView(
  //       child: Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: MediaQuery.of(context).size.height,
  //         decoration: new BoxDecoration(
  //           color: Colors.yellow,
  //         ),
  //         child: Column(
  //           //mainAxisSize: MainAxisSize.max,
  //           children: <Widget>[
  //             Expanded(
  //               child: PageView(
  //                 children: <Widget>[
  //                   _buildScan(context),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildScan(BuildContext context) {
  //   return Center(
  //     child: Container(
  //       //padding: const EdgeInsets.all(10.0),
  //       width: displayWidth,
  //       height: displayHeight,
  //       child: Column(
  //         children: <Widget>[
  //           Container(
  //             margin: EdgeInsets.only(
  //               top: displayHeight * 0.3,
  //               bottom: displayHeight * 0.3,
  //             ),
  //             height: displayHeight * 0.4,
  //             width: displayHeight * 0.4,
  //             //margin: const EdgeInsets.only(bottom: 10),
  //             child: QRView(
  //               key: qrKey,
  //               onQRViewCreated: _onQRViewCreated,
  //             )
  //           ),
  //           Center(
  //             child: Text('Scan result: $qrText'),
  //           ),
  //         ],
  //       ),
  //     )
  //   );
  // }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        print(scanData);
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}