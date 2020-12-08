import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TopDetail extends StatefulWidget {
  final String productId;
  final String imageUrl;
  final String categoryId;
  final String restaurantId;
  final double price;

  TopDetail({@required this.productId, @required this.imageUrl, @required this.categoryId, @required this.restaurantId, @required this.price});
  @override
  _TopDetailState createState() => _TopDetailState(productId: this.productId, imageUrl: this.imageUrl, categoryId: this.categoryId, restaurantId: this.restaurantId, price: this.price);
}

class TopTile extends StatelessWidget{
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  TopTile(
      {Key key,
        @required this.name,
        @required this.imageUrl,
        @required this.price,
        @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: displayHeight * 0.25,
          width: displayWidth,
          child: Image.network(
            'https://vikingsbr.com/wp-content/uploads/2019/11/BANNER_BLOG_PENEDO-2.png',
            height: displayHeight * 0.25,
            width: displayWidth,
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 5, bottom: 5),
              margin: EdgeInsets.only(
                top: displayHeight * 0.25,
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  bottom: 8,
                  right: 8,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontFamily: 'BalooBhai',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(description.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'BalooBhai',
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.only(
                                    //left: 5,
                                    right: 5,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 5,
                                    //bottom: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("R\$ " + price.toStringAsFixed(2),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'BalooBhai',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 5,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 5,
                                    bottom: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Top extends StatelessWidget {
  final String categoryId;
  final String productId;
  final String imageUrl;
  final String restaurantId;
  final double price;
  Top({@required this.productId, @required this.imageUrl, @required this.categoryId, @required this.restaurantId, this.price});

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('restaurantes').doc(this.restaurantId).collection('categorias').doc(this.categoryId).collection('produtos').doc(this.productId).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("Carregando dados...");
        return new TopTile(
          price: this.price ?? snapshot.data.data()["preco"],
          imageUrl: snapshot.data.data()["imagem"],
          name: snapshot.data.data()["nome"],
          description: snapshot.data.data()["descricao"],
        );
      },
    );

  }
}

class _TopDetailState extends State<TopDetail> {
  final String productId;
  final String imageUrl;
  final String categoryId;
  final String restaurantId;
  final double price;

  _TopDetailState({@required this.productId, @required this.imageUrl, @required this.categoryId, @required this.restaurantId, @required this.price});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Top(productId: productId, imageUrl: this.imageUrl, categoryId: this.categoryId, restaurantId: this.restaurantId, price: this.price),
      ],
    );
  }
}
