import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopRestaurant extends StatefulWidget {
  final String id;
  TopRestaurant({@required this.id});
  @override
  _TopRestaurantState createState() => _TopRestaurantState(id: this.id);
}

class TopTile extends StatelessWidget{
  final String name;
  final String imageUrl;
  final String rating;
  final String numberOfRating;
  final String price;
  final String address;
  final String category;
  final String cover;
  final double deliveryFee;
  final int minDeliveryTime;
  final int maxDeliveryTime;
  final double minOrder;

  TopTile(
      {Key key,
        @required this.name,
        @required this.imageUrl,
        @required this.rating,
        @required this.numberOfRating,
        @required this.price,
        @required this.address,
        @required this.category,
        @required this.cover,
        @required this.minDeliveryTime,
        @required this.maxDeliveryTime,
        @required this.minOrder,
        @required this.deliveryFee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: displayHeight * 0.25,
          width: displayWidth,
          child: Image.network(
            cover,
            height: displayHeight * 0.25,
            width: displayWidth,
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://cdn.pixabay.com/photo/2013/07/13/10/22/star-157086_1280.png',
                  width: 20,
                  height: 20,
                ),
                Text("4.9",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'BalooBhai',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(
              left: 7,
              right: 7,
            ),
            margin: EdgeInsets.only(
              top: displayHeight * 0.23,
              left: displayWidth * 0.10,
            ),
            height: displayHeight * 0.04,
            width: displayWidth * 0.18,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 5, bottom: 5),
              margin: EdgeInsets.only(
                top: displayHeight * 0.275,
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: Card(
                //semanticContainer: true,
                color: Colors.yellow,
                //clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //elevation: 1,
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 0,
                  bottom: 0,
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
                                      fontSize: 22.3,
                                      fontFamily: 'BalooBhai',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              //height: displayHeight * 0.008,
                            ),
                            Container(
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: displayWidth * 0.01,
                                        ),
                                        Text("$minDeliveryTime - $maxDeliveryTime Min",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'BalooBhai',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
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
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: displayWidth * 0.01,
                                        ),
                                        Text("Pedido mínimo: R\$" + minOrder.toStringAsFixed(2),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'BalooBhai',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
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
                                  Container(
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      size: 27,
                                    ),
                                    margin: EdgeInsets.only(
                                      //right: 5,
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
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.only(
              top: displayHeight * 0.185,
              left: displayWidth * 0.7,
            ),
            height: displayHeight * 0.12,
            width: displayWidth * 0.25,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Top extends StatelessWidget {
  final String id;
  Top({@required this.id});

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('restaurantes').doc(this.id).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("Carregando dados...");
        return new TopTile(
          address: snapshot.data.data()["endereco"],
          category: snapshot.data.data()["categoria_principal"],
          imageUrl: snapshot.data.data()["imagem"],
          name: snapshot.data.data()["nome"],
          cover: snapshot.data.data()["capa"],
          deliveryFee: snapshot.data.data()["taxa_entrega"] + .0,
          minDeliveryTime: snapshot.data.data()["tempo"]["minimo"],
          maxDeliveryTime: snapshot.data.data()["tempo"]["maximo"],
          minOrder: snapshot.data.data()["minimo"] + .0,
          price: "\$\$",
          numberOfRating: "31",
          rating: "4.1",
        );
      },
    );

  }
}

class _TopRestaurantState extends State<TopRestaurant> {
  final String id;
  _TopRestaurantState({@required this.id});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Top(id: this.id)
      ],
    );
  }
}
