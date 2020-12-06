import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/widgets/Address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class MyAdress extends StatefulWidget {
  @override
  _MyAdressState createState() => _MyAdressState();
}

class AdressTile extends StatelessWidget {
  String adress;
  String complement;
  String reference_point;
  String name;

  AdressTile(
      {Key key,
        @required this.adress,
        @required this.complement,
        @required this.reference_point,
        @required this.name,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
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
                                      name.toUpperCase(),
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
                                adress.toUpperCase(),
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
        ],
      ),
    );
  }
}
class AdressList extends StatelessWidget{

  // Future getUserCoupons() async {
  //   var userCoupons = await FirebaseFirestore.instance.collection('usuarios').doc(FirebaseAuth.instance.currentUser.uid).collection('cupons').snapshots();
  //   userCoupons.
  //   return coupons.docs;
  // }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('usuarios').doc(FirebaseAuth.instance.currentUser.uid).collection('enderecos').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("Carregando endereços...");
        return new ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: snapshot.data.docs.map((userAdress) {
            return new AdressTile(
              adress: userAdress['endereco'],
              complement: userAdress['complemento'],
              name: userAdress['nome'],
              reference_point: userAdress['ponto-referencia'],
            );
          }).toList(),
        );
      },
    );
  }
}


class _MyAdressState extends State<MyAdress> {

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: SingleChildScrollView(
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
            AdressList(),
            GestureDetector(
              onTap: (){
               Get.to(Address());
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
    );
  }
}
