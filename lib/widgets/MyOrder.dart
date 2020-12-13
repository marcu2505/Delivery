import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/screens/FoodDetailsPage.dart';
import 'package:flutter_login/screens/RestaurantPage.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/widgets/CouponsWidget.dart';
import 'package:flutter_login/widgets/FoodPromosWidget.dart';
import 'package:get/get.dart';
import 'Final.dart';
import 'package:path_provider/path_provider.dart';


class MyOrder extends StatefulWidget {
  final String restaurantId;

  MyOrder({
    @required this.restaurantId,
  });
  @override
  _MyOrderState createState() => _MyOrderState(restaurantId: this.restaurantId);
}

class OrderProduct{
  final String name;
  final String categoryId;
  final String restaurantId;
  final String productId;
  final String observation;
  final double discount;
  final double price;
  final int quantity;

  OrderProduct({
    @required this.name,
    @required this.price,
    @required this.quantity,
    @required this.categoryId,
    @required this.restaurantId,
    @required this.productId,
    @required this.discount,
    @required this.observation,

  });
}

class OrderList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getValues(),
      builder: (context, AsyncSnapshot<List<OrderProduct>> snapshot) {
        // if(!snapshot.hasData) {
        //   Future((){showDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (BuildContext ctx){
        //       return AlertDialog(
        //         title: Text("Carrinho vazio"),
        //         actions: <Widget>[
        //           RaisedButton(
        //             color: Colors.yellow,
        //             child: Text("Ok"),
        //             onPressed: (){
        //               Navigator.of(ctx).pop();
        //               Get.back();
        //             },
        //           ),
        //         ],
        //       );
        //     }
        //   );});
        // }
        return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: snapshot.data.map((product){
            return OrderTile(
              name: product.name,
              price: product.price,
              quantity: product.quantity,
              categoryId: product.categoryId,
              discount: product.discount,
              productId: product.productId,
              restaurantId: product.restaurantId,
              observation: product.observation,
            );
          }).toList(),
        );
      },
    );
  }
  Future<List<OrderProduct>> getValues() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;

    Map<String, dynamic> fileMap = {};
    var file = File('$path/cart.json');
    if(await file.exists()) {
      fileMap = jsonDecode(await file.readAsString());
    }

    Map<String, dynamic> productsMap = fileMap["produtos"];
    List<OrderProduct> products = [];
    productsMap.forEach((key, value) {
      print(value);
      var product = OrderProduct(
        name: value["nome"],
        price: value["preco"] + .0,
        quantity: value["quantidade"],
        categoryId: value["categoria"],
        discount: value["desconto"] + .0,
        productId: value["produto"],
        restaurantId: fileMap["restaurante"],
        observation: value["observacao"],
      );
      print(product);
      products.add(product);
    });
    print(products.length);
    return products;

  }

}

class OrderTile extends StatelessWidget{
  final String name;
  final String categoryId;
  final String restaurantId;
  final String productId;
  final String observation;
  final double discount;
  final double price;
  final int quantity;

  OrderTile({
    @required this.name,
    @required this.price,
    @required this.quantity,
    @required this.categoryId,
    @required this.restaurantId,
    @required this.productId,
    @required this.discount,
    @required this.observation,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  quantity.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'BalooBhai',
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BalooBhai',
                      color: Colors.black,
                    ),
                  ),
                  margin: EdgeInsets.only(
                    left: displayWidth * 0.05,
                  ),
                ),
              ],
            ),
          ),
          Container(
            //color: Colors.black,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "R\$ ${price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BalooBhai',
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    right: displayWidth * 0.01,
                    left: displayWidth * 0.01,
                  ),

                ),
                GestureDetector(
                  onTap: (){
                    Get.to(FoodDetailsPage(
                      productId: this.productId,
                      categoryId: this.categoryId,
                      imageUrl: "https://www.alphagel.com.br/wp-content/uploads/2017/09/a%C3%A7a%C3%AD-278x300.png",
                      restaurantId: this.restaurantId,
                      discount: this.discount,
                      price: this.price,
                      name: this.name,
                      observation: this.observation,
                      quantity: this.quantity,
                      onCart: true,
                    ));
                  },
                  child: Container(
                    child: Icon(
                      Icons.edit,
                    ),
                    margin: EdgeInsets.only(
                      left: displayWidth * 0.02,
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: displayHeight * 0.02,
              bottom: displayHeight * 0.02,
            ),
            //width: displayWidth * 0.87,
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.only(
        left: displayWidth * 0.03,
        right: displayWidth * 0.03,
        //top: displayHeight * 0.04,
        //bottom: displayHeight * 0.04,
      ),
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
    print("AAAAAAAAAAAAAA");
    print(this.name);
    print(this.description);
    print(this.price);
    print(this.productId);
    print(this.imageUrl);
    print(this.categoryId);
    print(this.restaurantId);
    print(this.discount);
    return InkWell(
      onTap: () {
        Get.to(FoodDetailsPage(productId: this.productId, imageUrl: imageUrl, categoryId: categoryId, restaurantId: this.restaurantId, price: this.price, discount: this.discount, name: this.name,));
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
                                  left: displayWidth * 0.13,
                                  right: displayWidth * 0.13,
                                  top: displayHeight * 0.005,
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
    print(categoryId);
    print(restaurantId);
    print(imageUrl);
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('restaurantes').doc(this.restaurantId).collection('categorias').doc(this.categoryId).collection('produtos').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("");
        return new ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: snapshot.data.docs.map((product) {
            print(product.data());
            print("AAAAAAAAAAAAAA");
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
            return new LastChanceTile(
              category: category.id,
              restaurantId: id,
            );
          }).toList(),
        );
      },
    );

  }
}

class LastChanceTile extends StatefulWidget {
  final String restaurantId;
  final String category;
  LastChanceTile(
      {Key key,
        @required this.category,
        @required this.restaurantId,
      })
      : super(key: key);

  @override
  _LastChanceTileState createState() => _LastChanceTileState(categoryId: this.category, restaurantId: this.restaurantId);
}

class _LastChanceTileState extends State<LastChanceTile> {
  final String name;
  final String categoryId;
  final String restaurantId;
  final String productId;
  final String observation;
  final double discount;
  final double price;
  final int quantity;

  _LastChanceTileState({
    @required this.name,
    @required this.price,
    @required this.quantity,
    @required this.categoryId,
    @required this.restaurantId,
    @required this.productId,
    @required this.discount,
    @required this.observation,
  });

  bool select = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 0,
      ),
      padding: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              setState(() {
                select = !select;
              });
              print(select);
            },
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    categoryId.substring(0, 9),
                    style: TextStyle(
                        fontSize: 22,
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
              width: displayWidth * 0.74,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.only(
                left: displayWidth * 0.13,
                right: displayWidth * 0.13,
                top: displayHeight * 0.005,
              ),
            ),
          ),
          !this.select ? ProductList(categoryId: categoryId, restaurantId: restaurantId, imageUrl: "https://static3.depositphotos.com/1003631/209/i/600/depositphotos_2099183-stock-photo-fine-table-setting-in-gourmet.jpg") : Container(),
        ],
      ),
    );
  }

}

class _MyOrderState extends State<MyOrder> {

  final String restaurantId;

  _MyOrderState({
    @required this.restaurantId,
  });

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.trip_origin
                        ),
                        Text(
                          "ENTREGAR AQUI",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'BalooBhai',
                            color: Colors.white,
                          ),
                        ),
                      ]
                    ),
                    width: displayWidth * 0.46,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                    ),
                    margin: EdgeInsets.only(
                      right: displayWidth * 0.01,
                      left: displayWidth * 0.01,
                    ),
                    padding: EdgeInsets.only(
                      left: displayWidth * 0.01,
                      right: displayWidth * 0.01,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.lens
                        ),
                        Text(
                          "RETIRAR NA LOJA",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'BalooBhai',
                            color: Colors.white,
                          ),
                        ),
                      ]
                    ),
                    width: displayWidth * 0.46,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                    ),
                    // margin: EdgeInsets.only(
                    //   left: displayWidth * 0.01,
                    //   right: displayWidth * 0.01,
                    // ),
                    padding: EdgeInsets.only(
                      left: displayWidth * 0.01,
                      right: displayWidth * 0.01,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(
                //   Radius.circular(10),
                // ),
                color: Colors.red,
              ),
              padding: EdgeInsets.only(
                left: displayWidth * 0.015,
                right: displayWidth * 0.015,
              ),
              width: displayWidth,
              height: displayWidth * 0.18,
            ),
            //produto
            OrderList(),
            //adicionar
            GestureDetector(
              onTap: (){
                print(restaurantId);
                Get.off(RestaurantPage(id: this.restaurantId));
              },
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.yellow,
                        size: 35,
                      ),
                      Text(
                        "ADICIONAR MAIS PRODUTOS",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'BalooBhai',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                margin: EdgeInsets.only(
                  top: displayHeight * 0.001,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border(
                    top: BorderSide(width: 3.0, color: Colors.black),
                    bottom: BorderSide(width: 3.0, color: Colors.black),
                  ),
                ),
                width: displayWidth,
                height: displayHeight * 0.06,
              ),
            ),
            //ultimo
            Container(
              child: Center(
                child: Text(
                  "ÚLTIMO DESEJO",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'BalooBhai',
                    color: Colors.white,
                  ),
                )
              ),
              margin: EdgeInsets.only(
                left: displayWidth * 0.2,
                right: displayWidth * 0.2,
                top: displayHeight * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: displayWidth * 0.6,
            ),
            //bebidas
            CategoryList(id: this.restaurantId),
            //cupom
            Container(
              child: Center(
                  child: Text(
                    "CUPOM DE DESCONTO",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BalooBhai',
                      color: Colors.white,
                    ),
                  )
              ),
              margin: EdgeInsets.only(
                left: displayWidth * 0.2,
                right: displayWidth * 0.2,
                top: displayHeight * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: displayWidth * 0.6,
            ),
            //adicionar
            Container(
              margin: EdgeInsets.only(
                top: 0,
              ),
              padding: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "ADICIONAR CUPOM",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                    width: displayWidth * 0.74,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: displayWidth * 0.13,
                      right: displayWidth * 0.13,
                      top: displayHeight * 0.005,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: displayHeight * 0.03,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "SUBTOTAL: 60.70",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 3,
                      bottom: 3,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                  ),
                  Container(
                    child: Text(
                      "TAXA DE ENTREGA: 60.70",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 3,
                      bottom: 3,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "DESCONTO: 60.70",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 10,
                          top: 3,
                          bottom: 3,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      Container(
                        child: Text(
                          "TOTAL: 60.70",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          right: 10,
                          top: 3,
                          bottom: 3,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 3, color: Colors.black),
                  bottom: BorderSide(width: 3, color: Colors.black),
                ),
              ),
              width: displayHeight,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, ScaleRoute(page: Final()));
              },
              child: Container(
                child: Center(
                    child: Text(
                      "TUDO CERTO",
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
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
