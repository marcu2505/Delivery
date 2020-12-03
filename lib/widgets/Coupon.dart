import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/globals.dart';

class Coupon extends StatefulWidget {
  @override
  _CouponState createState() => _CouponState();
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
  CouponList();

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
            if(cupons["cupom"] == coupon_new.text){
              print(cupons["descricao"]);
              print(FirebaseAuth.instance.currentUser.uid);
              print(cupons.id);
              FirebaseFirestore.instance.collection('usuario-cupom').add(
                  {
                    'coupon_id': cupons.id,
                    'user_id': FirebaseAuth.instance.currentUser.uid,
                  }
              );
            }
            return new CouponTile(
              cupom: cupons['cupom'],
              descricao: cupons['descricao'],
            );

          }).toList(),
        );
      },
    );
  }
}

TextEditingController coupon_new = new TextEditingController();

class _CouponState extends State<Coupon> {
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
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: <Widget>[
            //       Expanded(
            //         child: Container(
            //           child: Text(
            //             "Ativos".toUpperCase(),
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.black,
            //                 fontFamily: 'BalooBhai',
            //                 fontWeight: FontWeight.w300
            //             ),
            //             textAlign: TextAlign.center,
            //           ),
            //           //width: displayWidth * 0.475,
            //         ),
            //       ),
            //       VerticalDivider(
            //         thickness: 3,
            //         color: Colors.black,
            //       ),
            //       Expanded(
            //         child: Container(
            //           child: Text(
            //             "Inativos".toUpperCase(),
            //             style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.black,
            //                 fontFamily: 'BalooBhai',
            //                 fontWeight: FontWeight.w300
            //             ),
            //             textAlign: TextAlign.center,
            //           ),
            //           //width: displayWidth * 0.475,
            //         ),
            //       ),
            //     ],
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //   ),
            //   width: displayWidth,
            //   height: displayHeight * 0.075,
            // ),
            // Container(
            //   child: Card(
            //     semanticContainer: true,
            //     clipBehavior: Clip.antiAliasWithSaveLayer,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(21.0),
            //     ),
            //     elevation: 1,
            //     margin: EdgeInsets.all(5),
            //     child: Padding(
            //       padding: EdgeInsets.only(
            //         top: 8,
            //         bottom: 8,
            //         left: 8,
            //         right: 8,
            //       ),
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: <Widget>[
            //           Row(
            //             children: <Widget>[
            //               ClipRRect(
            //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //                 child: Icon(
            //                   Icons.more,
            //                   size: 40,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: displayWidth * 0.02,
            //               ),
            //               Expanded(
            //                 child: Column(
            //                   mainAxisSize: MainAxisSize.min,
            //                   crossAxisAlignment: CrossAxisAlignment.stretch,
            //                   children: <Widget>[
            //                     Container(
            //                       child: Row(
            //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                         children: <Widget>[
            //                           Text(
            //                             "Cupom de 10%\nCódigo: DR1000".toUpperCase(),
            //                             style: TextStyle(
            //                                 fontSize: 20,
            //                                 color: Colors.black,
            //                                 fontFamily: 'BalooBhai',
            //                                 fontWeight: FontWeight.w300
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     Text(
            //                       "10% DE DESCONTO NA FRUTA SUL".toUpperCase(),
            //                       style: TextStyle(
            //                         fontSize: 15,
            //                         color: Colors.black,
            //                         fontFamily: 'BalooBhai',
            //                         fontWeight: FontWeight.w300,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Divider(
            //             color: Colors.black,
            //             thickness: 3,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: <Widget>[
            //               Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 //crossAxisAlignment: CrossAxisAlignment.stretch,
            //                 children: <Widget>[
            //                   Container(
            //                     child: Row(
            //                       children: <Widget>[
            //                         Container(
            //                           child: Icon(
            //                             Icons.timer,
            //                           ),
            //                           padding: EdgeInsets.symmetric(
            //                             horizontal: 5,
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           width: displayWidth * 0.01,
            //                         ),
            //                         Text(
            //                           "O PRAZO DE VALIDADE VENCEU".toUpperCase(),
            //                           style: TextStyle(
            //                               fontSize: 15,
            //                               color: Colors.grey,
            //                               fontFamily: 'BalooBhai',
            //                               fontWeight: FontWeight.w300
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            //   margin: EdgeInsets.only(
            //     top: displayHeight * 0.02,
            //   ),
            // ),
            CouponList(),
            FloatingActionButton(
              onPressed: (){
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext ctx){
                    final input = TextFormField(
                      controller: coupon_new,
                      decoration: InputDecoration(
                        hintText: "Cupom",
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );

                    return AlertDialog(
                      title: Text("Novo cupom"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            input,
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        RaisedButton(
                          color: Colors.yellow,
                          child: Text("Cancelar"),
                          onPressed: (){
                            Navigator.of(ctx).pop();
                          },
                        ),
                        RaisedButton(
                          color: Colors.yellow,
                          child: Text("Adicionar"),
                          onPressed: (){
                            CouponList();
                            print(coupon_new.text);
                            //Navigator.of(ctx).pop();
                          },
                        ),
                      ],
                    );
                  }
                );
              },
              child: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


