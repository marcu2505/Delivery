import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/utils/humanize.dart';
import 'package:get/get.dart';

class CouponsWidget extends StatefulWidget {
  final bool clickable;
  final bool activeCoupons;
  CouponsWidget({@required this.clickable, @required this.activeCoupons});

  @override
  _CouponsWidgetState createState() => _CouponsWidgetState(clickable: this.clickable, activeCoupons: this.activeCoupons);
}

class _CouponsWidgetState extends State<CouponsWidget> {
  final bool clickable;
  final bool activeCoupons;
  _CouponsWidgetState({@required this.clickable, @required this.activeCoupons});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CouponsList(clickable: widget.clickable, activeCoupons: widget.activeCoupons),
        ],
      ),
    );
  }
}

class CouponTile extends StatelessWidget  {
  final bool clickable;
  final String coupon;
  final String description;
  final Timestamp expirationDate;

  CouponTile({
    Key key,
    @required this.clickable,
    @required this.coupon,
    @required this.description,
    @required this.expirationDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.clickable ? () {
        print("CLIQUEI");
      } : null,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
            ),
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
                    // Dados Cupom
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Image(
                              image: AssetImage(
                                'assets/icon/icon.png',
                              ),
                              width: 50,
                              height: 50,
                            ),
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
                              // Nome Cupom
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      coupon.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontFamily: 'BalooBhai',
                                          fontWeight: FontWeight.w300
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Descrição
                              Text(
                                description.toUpperCase(),
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
                    // Dados extras e validade
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            this.expirationDate.compareTo(Timestamp.now()) <= 0 ? Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Icon(
                                      Icons.timer,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                  ),
                                  Text(
                                    "O PRAZO DE VALIDADE VENCEU",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontFamily: 'BalooBhai',
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                ],
                              ),
                            ) : Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "CONDIÇÕES",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontFamily: 'BalooBhai',
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Icon(
                                          Icons.timer,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                      ),
                                      Text(
                                        "EXPIRA EM " + humanizeDate(this.expirationDate).toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontFamily: 'BalooBhai',
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

class Coupon {
  String coupon;
  String description;
  Timestamp expirationDate;
  Coupon({this.coupon, this.description, this.expirationDate});
}

class CouponsList extends StatelessWidget {
  final bool clickable;
  final bool activeCoupons;
  CouponsList({@required this.clickable, @required this.activeCoupons});

  Stream<List<Coupon>> getUserCoupons(bool activeCoupons) async* {
    var checkIsGreater;
    var checkIsLessOrEqual;
    activeCoupons ? checkIsGreater = Timestamp.now() : checkIsLessOrEqual = Timestamp.now();

    yield* FirebaseFirestore.instance
        .collection('usuarios')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('cupons')
        .where("validade", isGreaterThan: checkIsGreater, isLessThanOrEqualTo: checkIsLessOrEqual)
        .snapshots()
        .asyncMap((snapshot) async {
          final list = snapshot.docs.map((doc) async {
            final resultCoupon = await FirebaseFirestore.instance.collection('cupons').doc(doc.data()["cupom"]).get();
            var coupon = Coupon(
              coupon: resultCoupon.data()["cupom"],
              description: resultCoupon.data()["descricao"],
              expirationDate: doc.data()["validade"],
            );
            return coupon;
          }).toList();
          return await Future.wait(list);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<List<Coupon>>(
      stream: getUserCoupons(this.activeCoupons),
      builder: (BuildContext context, AsyncSnapshot<List<Coupon>> snapshot) {
        if(snapshot.hasError) {
          // TODO: checar possibilidade de logar erro
          Get.back();
          return new Container();
        }
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text("Carregando...");
          default:
            return new ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: snapshot.data.map((coupon) {
                return new CouponTile(
                  clickable: this.clickable,
                  coupon: coupon.coupon,
                  description: coupon.description,
                  expirationDate: coupon.expirationDate,
                );
              }).toList(),
            );
        }
      },
    );
  }
}
