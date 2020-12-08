import 'dart:convert';
import 'dart:io';
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
                          "BEBIDAS",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
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
                ],
              ),
            ),
            //sobremesa
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
                          "SOBREMESA",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontFamily: 'BalooBhai',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
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
                ],
              ),
            ),
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
