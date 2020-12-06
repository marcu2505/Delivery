import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/dialog.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/widgets/CouponsWidget.dart';

class CouponsPage extends StatefulWidget {
  final bool clickable;
  CouponsPage({@required this.clickable});

  @override
  _CouponsPageState createState() => _CouponsPageState(clickable: this.clickable);
}

class _CouponsPageState extends State<CouponsPage> {
  final bool clickable;
  _CouponsPageState({@required this.clickable});

  final newCoupon = new TextEditingController();

  bool activeCoupons = true;

  Timestamp getCouponExpirationDate(DocumentSnapshot coupon) {
    if(coupon.data().containsKey("valido_por")) {
      return Timestamp.fromDate(DateTime.now().add(Duration(hours: coupon.data()["valido_por"])));
    }

    print(coupon.data()["valido_ate"]);
    return coupon.data()["valido_ate"];
  }

  void addCoupon() async {
    var coupon = await FirebaseFirestore.instance.collection('cupons').where("cupom", isEqualTo: newCoupon.text.trim().toLowerCase()).limit(1).get();

    // TODO: checar data de validade
    if(coupon != null && coupon.docs.isNotEmpty) {
      var couponId = coupon.docs.first.id;
      var userCoupon = await FirebaseFirestore.instance.collection('usuarios').doc(FirebaseAuth.instance.currentUser.uid).collection('cupons').doc(couponId).get();
      if(userCoupon != null && userCoupon.data() == null) {
        FirebaseFirestore.instance.collection('usuarios').doc(FirebaseAuth.instance.currentUser.uid).collection('cupons').doc(couponId).set(
            {
              "cupom": couponId,
              "data": Timestamp.now(),
              "validade": getCouponExpirationDate(coupon.docs.first),
            }
        );
      } else {
        showMessageDialog(context: context, message: "Cupom já inserido");
      }
    } else {
      showMessageDialog(context: context, message: "Cupom inválido/expirado");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext ctx){
                final input = TextFormField(
                  controller: newCoupon,
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
                      onPressed: Navigator.of(ctx).pop,
                    ),
                    RaisedButton(
                      color: Colors.yellow,
                      child: Text("Adicionar"),
                      onPressed: (){
                        addCoupon();
                        Navigator.of(ctx).pop();
                      },
                    ),
                  ],
                );
              }
          );
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
        ),
      ),
      content: SingleChildScrollView(
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
                      child: GestureDetector(
                        onTap: () {
                          setState(() => activeCoupons = true);
                        },
                        child: Text(
                          "Ativos".toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => activeCoupons = false);
                        },
                        child: Text(
                          "Inativos".toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: displayWidth,
              height: displayHeight * 0.075,
            ),
            this.activeCoupons ? Container() : Container(color: Colors.deepPurple),
            CouponsWidget(clickable: this.clickable, activeCoupons: activeCoupons),
          ],
        ),
      ),
    );
  }
}