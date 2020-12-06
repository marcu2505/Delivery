import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/screens/FoodDetailsPage.dart';
import 'package:get/get.dart';

class FoodPromosWidget extends StatefulWidget {
  @override
  _FoodPromosWidgetState createState() => _FoodPromosWidgetState();
}

class _FoodPromosWidgetState extends State<FoodPromosWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight * 0.377,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          FoodPromosTitle(),
          Expanded(
            child: FoodPromosList(),
          )
        ],
      ),
    );
  }
}

class FoodPromosTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 3,
      ),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
            child: Text(
              "Promoções".toUpperCase(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'BalooBhai',
                  fontWeight: FontWeight.w300
              ),
            ),
            decoration: BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodPromosList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('promocoes').where("type", isEqualTo: "food").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("Carregando dados...");
        return new ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          children: snapshot.data.docs.map((promocoes) {
            return new FoodPromosTile(
              productId: promocoes.data()["produto_id"],
              categoryId: promocoes.data()["categoria_id"],
              restaurantId: promocoes.data()["restaurante_id"],
              description: promocoes.data()["descricao"],
              imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
              name: promocoes.data()["nome"],
              price_0: promocoes.data()["preco_0"] + .0,
              price_1: ((promocoes.data()["preco_0"] + .0) * (100.0 - (promocoes.data()["desconto"] + .0)) / 100.0),
              discount: promocoes.data()["desconto"] + .0,
            );
          }).toList(),
        );
      },
    );

  }
}

class FoodPromosTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String description;
  final String categoryId;
  final String productId;
  final String restaurantId;
  final double price_0;
  final double price_1;
  final double discount;

  FoodPromosTile(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.price_0,
      @required this.price_1,
      @required this.description,
      @required this.restaurantId,
      @required this.categoryId,
      @required this.productId,
      @required this.discount,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          FoodDetailsPage(
            restaurantId: this.restaurantId,
            imageUrl: this.imageUrl,
            categoryId: this.categoryId,
            productId: this.productId,
            discount: this.discount,
            price: this.price_1,
          )
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5),
            decoration: BoxDecoration(boxShadow: [
            ]),
            child: Card(
                color: Colors.white,
                elevation: 0,
                margin: EdgeInsets.only(
                  top: 5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(21.0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 7,
                    // right: 5,
                    // left: 5,
                    //bottom: 5,
                  ),
                  width: displayWidth * 0.55,
                  //height:  displayHeight * 0.29,
                  child: Column(children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  width: displayWidth * 0.4,
                                  height: 80,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'BalooBhai',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            description,
                            style: TextStyle(
                              color: Color(0xAF3a3a3b),
                              fontWeight: FontWeight.w100,
                              fontSize: 14,
                              fontFamily: 'BalooBhai',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Align(
                              alignment: Alignment.center,
                               child: Center(
                                  child: Text(
                                    price_0.toStringAsFixed(2),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14,
                                      fontFamily: 'BalooBhai',
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                               ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.red,
                            ),
                            width: displayWidth * 0.15,
                            height: displayHeight * 0.03,
                          ),
                          Container(
                            child: Icon(
                              Icons.arrow_forward,
                              size: displayHeight * 0.03,
                            ),
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                price_1.toStringAsFixed(2),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 14,
                                  fontFamily: 'BalooBhai',
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.green,
                            ),
                            width: displayWidth * 0.13,
                            height: displayHeight * 0.03,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: displayHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              bottom: displayHeight * 0.015,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'QUERO ESSE',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 16,
                                  fontFamily: 'BalooBhai',
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.yellow,
                            ),
                            width: displayWidth * 0.40,
                            height: displayHeight * 0.033,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}

// class FoodPromosList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       scrollDirection: Axis.horizontal,
//       children: <Widget>[
//         FoodPromosTile(
//           name: "Fried Egg",
//           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
//           price_0: 20.00,
//           price_1: 10.00,
//           description: "Pão, bacon, tomate, ovo",
//           restaurantId: "Oi",
//           categoryId: "uiu",
//           productId: "livia",
//         ),
//         FoodPromosTile(
//             name: "Fried Egg",
//             imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
//             price_0: 20.00,
//             price_1: 10.00,
//             description: "Pão, bacon, tomate, ovo",
//             restaurantId: "Oi",
//             categoryId: "uiu",
//             productId: "livia"),
//         FoodPromosTile(
//             name: "Fried Egg",
//             imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
//             price_0: 20.00,
//             price_1: 10.00,
//             description: "Pão, bacon, tomate, ovo",
//             restaurantId: "Oi",
//             categoryId: "uiu",
//             productId: "livia"),
//         FoodPromosTile(
//             name: "Fried Egg",
//             imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
//             price_0: 20.00,
//             price_1: 10.00,
//             description: "Pão, bacon, tomate, ovo",
//             restaurantId: "Oi",
//             categoryId: "uiu",
//             productId: "livia"),
//       ],
//     );
//   }
// }


