import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/screens/FoodDetailsPage.dart';
import 'package:flutter_login/screens/RestaurantPage.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/widgets/Details.dart';
import 'package:get/get.dart';

class RestaurantAll extends StatefulWidget {
  final String id;
  RestaurantAll({@required this.id});
  @override
  _RestaurantAllState createState() => _RestaurantAllState(id: this.id);
}

class _RestaurantAllState extends State<RestaurantAll> {
  final String id;
  _RestaurantAllState({@required this.id});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryList(id: this.id),
        ],
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  final String restaurantId;
  final String category;
  CategoryTile(
      {Key key,
        @required this.category,
        @required this.restaurantId,
        })
      : super(key: key);

  @override
  _CategoryTileState createState() => _CategoryTileState(category: this.category, key: this.key, restaurantId: this.restaurantId);
}

class _CategoryTileState extends State<CategoryTile> {
  String category;
  final String restaurantId;
  _CategoryTileState({
    Key key,
    @required this.category,
    @required this.restaurantId,
  });

  bool select = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 0,
          ),
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    select = !select;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        category.substring(0, 9).toUpperCase(),
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.black,
                            fontFamily: 'BalooBhai',
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      this.select ? Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                        size: 35,
                      ) : Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 35,
                      ),
                    ],
                  ),
                  width: displayWidth * 0.94,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        !this.select ? ProductList(categoryId: category, restaurantId: restaurantId,) : Container(),
      ],
    );
  }
}

class CategoryList extends StatelessWidget {
  final String id;
  CategoryList({@required this.id});

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('restaurantes').doc(this.id).collection('categorias').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("Carregando dados...");
        return new ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: snapshot.data.docs.map((category) {
            return new CategoryTile(
              category: category.id,
              restaurantId: id,
            );
          }).toList(),
        );
      },
    );

  }
}

class ProductTile extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final double discount;
  final String productId;
  final String imageUrl;
  final String categoryId;
  final String restaurantId;

  ProductTile({
    Key key,
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.productId,
    @required this.imageUrl,
    @required this.categoryId,
    @required this.restaurantId,
    @required this.discount,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(FoodDetailsPage(productId: this.productId, imageUrl: imageUrl, categoryId: categoryId, restaurantId: this.restaurantId, price: this.price, discount: this.discount));
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 2.5, bottom: 2.5),
            decoration: BoxDecoration(
              //color: Colors.black,
            ),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              margin: EdgeInsets.only(
                left: 5,
                right: 5,
                top: 0,
                bottom: 0,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 20,
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
                                    fontSize: 21,
                                    fontFamily: 'BalooBhai',
                                  ),
                                ),

                              ),
                              Container(
                                child: Text("R\$ " + price.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'BalooBhai',
                                    color: Colors.white,
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
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            //height: displayHeight * 0.008,
                          ),
                          Text(description.toUpperCase(),
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'BalooBhai',
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

class ProductList extends StatelessWidget {
  final String categoryId;
  final String restaurantId;
  final String imageUrl;
  ProductList({@required this.categoryId, @required this.restaurantId, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('restaurantes').doc(this.restaurantId).collection('categorias').doc(this.categoryId).collection('produtos').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("");
        return new ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: snapshot.data.docs.map((product) {
            return new ProductTile(
              name: product["nome"],
              description: product["descricao"],
              price: (product["preco"] + .0) * (100.0 - (product["desconto"])) / 100.0,
              productId: product.id,
              categoryId: categoryId,
              imageUrl: imageUrl,
              restaurantId: restaurantId,
              discount: product["desconto"] + .0,
            );
          }).toList(),
        );
      },
    );

  }
  // Widget build(BuildContext context) {
  //   return ListView(
  //     padding: EdgeInsets.zero,
  //     shrinkWrap: true,
  //     physics: ClampingScrollPhysics(),
  //     children: <Widget>[
  //       BestRestaurantsTiles(
  //           name: "QUINTA AVENIDA",
  //           imageUrl: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/cf/Logotipo_do_Burger_King.svg/600px-Logotipo_do_Burger_King.svg.png",
  //           rating: '4.9',
  //           numberOfRating: '200',
  //           price: '\$\$\$',
  //           slug: "fried_egg",
  //           category: "MARMITEX",
  //           address: "Rua Vaz de Melo, 102",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Nova Opção",
  //           imageUrl: "https://upload.wikimedia.org/wikipedia/pt/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png",
  //           rating: "4.9",
  //           numberOfRating: "100",
  //           price: '\$\$',
  //           slug: "",
  //           category: "ALMOÇO",
  //           address: "Rua Helena Silva, 22",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Edd's burguer",
  //           imageUrl: "https://static-images.ifood.com.br/image/upload//logosgde/e8813e59-7284-4139-b86d-1c5e221822d4/202005231752_rKMI_i.png",
  //           rating: "4.0",
  //           numberOfRating: "50",
  //           price: '\$\$\$',
  //           slug: "",
  //           category: "Hamburguer",
  //           address: "Avenida Braga Viana, 1092",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Açaí da praça",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.0",
  //           numberOfRating: "100",
  //           price: '\$',
  //           slug: "",
  //           category: "Açaí",
  //           address: "Rua Iolanda Barbosa, 879",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Subway",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.6",
  //           numberOfRating: "150",
  //           price: '\$\$',
  //           slug: "",
  //           category: "Sanduíche",
  //           address: "Avenida Vine Nigo",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Burger King",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.0",
  //           numberOfRating: "100",
  //           price: '\$\$\$',
  //           slug: "",
  //           category: "Hamburguer",
  //           address: "Rua New York, 666",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Pais e Filhos",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.2",
  //           numberOfRating: "70",
  //           price: '\$',
  //           slug: "",
  //           category: "Sorveteria",
  //           address: "Avenida Paraguai, 54",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Spolleto",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: '4.9',
  //           numberOfRating: '200',
  //           price: '\$',
  //           slug: "",
  //           category: "Italiana",
  //           address: "Rua Visconde Jonas, 671",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Refrescar",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.6",
  //           numberOfRating: "150",
  //           price: '\$\$',
  //           slug: "",
  //           category: "Bebidas",
  //           address: "Rua Bruna Gaules, 681",
  //           deliveryFee: 4.99),
  //       BestRestaurantsTiles(
  //           name: "Natureba",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.6",
  //           numberOfRating: "150",
  //           price: '\$\$\$',
  //           slug: "",
  //           category: "Almoço",
  //           address: "Rua Bosco Vini, 98",
  //           deliveryFee: 4.99),
  //       BestRestaurantsTiles(
  //           name: "Aviões da grelha",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.6",
  //           numberOfRating: "150",
  //           price: '\$\$',
  //           slug: "",
  //           category: "Carne",
  //           address: "Rua Eni Moura, 128",
  //           deliveryFee: 4.99),
  //       BestRestaurantsTiles(
  //           name: "Quinta avenida",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: '4.9',
  //           numberOfRating: '200',
  //           price: '\$\$\$',
  //           slug: "fried_egg",
  //           category: "Marmitex",
  //           address: "Rua Vaz de Melo, 102",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Nova Opção",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.9",
  //           numberOfRating: "100",
  //           price: '\$\$',
  //           slug: "",
  //           category: "Almoço",
  //           address: "Rua Helena Silva, 22",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Edd's burguer",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.0",
  //           numberOfRating: "50",
  //           price: '\$\$\$',
  //           slug: "",
  //           category: "Hamburguer",
  //           address: "Avenida Braga Viana, 1092",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Açaí da praça",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.0",
  //           numberOfRating: "100",
  //           price: '\$',
  //           slug: "",
  //           category: "Açaí",
  //           address: "Rua Iolanda Barbosa, 879",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Subway",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.6",
  //           numberOfRating: "150",
  //           price: '\$\$',
  //           slug: "",
  //           category: "Sanduíche",
  //           address: "Avenida Vine Nigo",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Burger King",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.0",
  //           numberOfRating: "100",
  //           price: '\$\$\$',
  //           slug: "",
  //           category: "Hamburguer",
  //           address: "Rua New York, 666",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Pais e Filhos",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.2",
  //           numberOfRating: "70",
  //           price: '\$',
  //           slug: "",
  //           category: "Sorveteria",
  //           address: "Avenida Paraguai, 54",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Spolleto",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: '4.9',
  //           numberOfRating: '200',
  //           price: '\$',
  //           slug: "",
  //           category: "Italiana",
  //           address: "Rua Visconde Jonas, 671",
  //           deliveryFee: 0.00),
  //       BestRestaurantsTiles(
  //           name: "Refrescar",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.6",
  //           numberOfRating: "150",
  //           price: '\$\$',
  //           slug: "",
  //           category: "Bebidas",
  //           address: "Rua Bruna Gaules, 681",
  //           deliveryFee: 4.99),
  //       BestRestaurantsTiles(
  //           name: "Natureba",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.6",
  //           numberOfRating: "150",
  //           price: '\$\$\$',
  //           slug: "",
  //           category: "Almoço",
  //           address: "Rua Bosco Vini, 98",
  //           deliveryFee: 4.99),
  //       BestRestaurantsTiles(
  //           name: "Aviões da grelha",
  //           imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
  //           rating: "4.6",
  //           numberOfRating: "150",
  //           price: '\$\$',
  //           slug: "",
  //           category: "Carne",
  //           address: "Rua Eni Moura, 128",
  //           deliveryFee: 4.99),
  //     ],
  //   );
  // }
}
