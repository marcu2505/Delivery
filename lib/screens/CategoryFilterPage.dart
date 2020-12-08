import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/RestaurantPage.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/widgets/RestaurantsWidget.dart';
import 'package:flutter_login/globals.dart';
import 'package:get/get.dart';

class CategoryFilterPage extends StatefulWidget {
  final String category;
  final String categoryName;
  CategoryFilterPage({@required this.category, @required this.categoryName});

  @override
  _CategoryFilterPageState createState() => _CategoryFilterPageState(category: this.category, categoryName: this.categoryName);
}

class _CategoryFilterPageState extends State<CategoryFilterPage> {
  final String category;
  final String categoryName;
  _CategoryFilterPageState({@required this.category, @required this.categoryName});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    super.dispose();
  }

  // Função para filtrar restaurantes por categoria
  filterRests(String category) async {
    var result = await firestore.collection('categorias').doc(category).collection('restaurantes').get();
    List<String> restaurantIds = result.docs.map((restaurant) => restaurant.id).toList();
    print(restaurantIds);

    // result = await firestore
    //     .collection('restaurantes-categorias')
    //     .where("category", isEqualTo: categoryID)
    //     .get();
    //
    // result.docs.forEach((doc) {
    //   print(doc.id);  // ID da relação
    //   firestore.collection('restaurantes').doc(doc["restaurant"]).get().then((value) => {
    //     print(value["name"])
    //   });
    // }); // Restaurantes
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            CategoryFilterTitle(category: this.category, categoryName: this.categoryName),
            CategoryFilterList(category: this.category),
          ],
        ),
      ),
    );
  }
}

class CategoryFilterTitle extends StatelessWidget {
  final String category;
  final String categoryName;
  const CategoryFilterTitle({@required this.category, @required this.categoryName});

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
            padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
            child: Text(
              "CATEGORIA: ${this.categoryName.toUpperCase()}",
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

class CategoryFilterTile extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final String rating;
  final String numberOfRating;
  final String price;
  final String address;
  final String category;
  final double deliveryFee;


  CategoryFilterTile(
      {Key key,
        @required this.name,
        @required this.imageUrl,
        @required this.rating,
        @required this.numberOfRating,
        @required this.price,
        @required this.id,
        @required this.address,
        @required this.category,
        @required this.deliveryFee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(RestaurantPage(id: this.id));
      },
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
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(imageUrl,
                        height: displayHeight * 0.13,
                        width: displayHeight * 0.13,
                        fit: BoxFit.cover,
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
                          Text(name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 21,
                              fontFamily: 'BalooBhai',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(category.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'BalooBhai',
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                  top: 2,
                                  bottom: 2,
                                  left: 5,
                                  right: 5,
                                ),
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Image.network(
                                    'https://cdn.pixabay.com/photo/2013/07/13/10/22/star-157086_1280.png',
                                    width: 14,
                                    height: 14,
                                  ),
                                  Text(rating,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'BalooBhai',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: displayHeight * 0.008,
                          ),
                          Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                child: Image.asset(
                                  'assets/img/logo.png',
                                  width: displayWidth * 0.06,
                                  height: displayWidth * 0.06,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(address.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'BalooBhai',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            children: [
                              Container(
                                child: getDeliveryFee(deliveryFee),
                                padding: EdgeInsets.only(
                                  top: 2,
                                  bottom: 2,
                                  left: 5,
                                  right: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }

  Text getDeliveryFee(double deliveryFee) {
    String text = "FRETE GRÁTIS";
    double textSize = 14.6;
    if(deliveryFee.round() > 0) {
      text = "R\$ " + deliveryFee.toStringAsFixed(2);
      textSize = 14.6;
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        color: Colors.yellow,
        fontFamily: 'BalooBhai',
      ),
    );
  }
}

class Restaurant {
  final DocumentSnapshot document;
  final String imageURL;
  Restaurant({@required this.document, @required this.imageURL});
}

class CategoryFilterList extends StatelessWidget {
  final String category;
  CategoryFilterList({@required this.category});

  Stream<List<Restaurant>> getCategoryRestaurant(String category) async* {
    yield* FirebaseFirestore.instance
        .collection('categorias')
        .doc(category)
        .collection('restaurantes')
        .snapshots()
        .asyncMap((snapshot) async {
          final list = snapshot.docs.map((restaurantDoc) async {
            var document = await FirebaseFirestore.instance.collection('restaurantes').doc(restaurantDoc.id).get();
            var imageURL = await FirebaseStorage.instance.ref().child('restaurantes/').child('${restaurantDoc.id}/').child('image.jpg').getDownloadURL();
            return Restaurant(document: document, imageURL: imageURL);
          }).toList();
          return await Future.wait(list);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<List<Restaurant>>(
      stream: getCategoryRestaurant(this.category),
      builder: (BuildContext context, AsyncSnapshot<List<Restaurant>> snapshot) {
        if(snapshot.hasError) {
          // TODO: checar possibilidade de logar erro
          Get.back();
          return new Container();
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text("Carregando...");
          default:
            return new ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: snapshot.data.map((restaurant) {
                return new RestaurantTile(
                  name: restaurant.document["nome"],
                  address: restaurant.document["endereco"],
                  imageUrl: restaurant.imageURL,
                  category: restaurant.document["categoria_principal"],
                  rating: '4.9',
                  numberOfRating: '200',
                  price: '\$\$\$',
                  id: restaurant.document.id,
                  deliveryFee: restaurant.document["taxa_entrega"],
                );
              }).toList(),
            );
        }
      },
    );
  }
}
