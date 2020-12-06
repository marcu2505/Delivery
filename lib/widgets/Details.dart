import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_login/dialog.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/widgets/MyOrder.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class Details extends StatefulWidget {

  final String productId;
  final String userId;
  final String restaurantId;
  final String categoryId;
  final double discount;
  final double price;

  @override

  _DetailsState createState() => _DetailsState(
    restaurantId: this.restaurantId,
    categoryId: this.categoryId,
    productId: this.productId,
    discount: this.discount,
    userId: this.userId,
    price: this.price,
  );
  Details({
    @required this.productId,
    @required this.categoryId,
    @required this.restaurantId,
    @required this.price,
    @required this.discount,
    @required this.userId,
  });
}

class _DetailsState extends State<Details> {

  final String productId;
  final String userId;
  final String restaurantId;
  final String categoryId;
  final double discount;
  final double price;

  _DetailsState({
    @required this.productId,
    @required this.categoryId,
    @required this.restaurantId,
    @required this.price,
    @required this.discount,
    @required this.userId,
  });

  int produtCount = 1;

  @override

  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 24,
                  ),
                  SizedBox(
                    width: displayWidth * 0.02,
                  ),
                  Text(
                    "ALGUMA OBSERVAÇÃO?",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'BalooBhai',
                    ),
                  )
                ]
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: displayWidth * 0.08,
                  top: displayHeight * 0.01,
                  right: displayWidth * 0.08,
                  bottom: displayHeight * 0.02,
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    cursorColor: Colors.grey,
                    primaryColor: Colors.white,
                  ),
                  child: Material(
                    color: Colors.white,
                    elevation: 7.0,
                    shadowColor: Colors.grey,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                    child: Container(
                      height: displayHeight * 0.10,
                      child:TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 2,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.grey, fontFamily: 'BalooBhai',),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white
                            ),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          fillColor: Colors.white,
                          hintStyle: new TextStyle(color: Colors.grey, fontSize: 18.0, fontFamily: 'BalooBhai',),
                          hintText: "Ex.: Sem cebola e ovo".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                //top: displayHeight * 0.02,
                //bottom: displayHeight * 0.01,
              ),
              child: Center(
                child: Text(
                  "Quantidade".toUpperCase(),
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'BalooBhai',
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        if(produtCount > 1){
                          setState(() {
                            produtCount--;
                          });
                        }
                      },
                      child: Container(
                        child: Icon(
                          Icons.remove,
                          size: 40,
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.only(
                          right: displayWidth * 0.015,
                          left: displayWidth * 0.015,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        produtCount.toString(),
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'BalooBhai',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      margin: EdgeInsets.only(
                        left: displayWidth * 0.05,
                        right: displayWidth * 0.05,
                      ),
                      width: displayWidth * 0.13,
                    ),
                    GestureDetector(
                      onTap: (){
                        if (produtCount < 99) {
                          setState(() {
                            produtCount++;
                          });
                        }
                      },
                      child: Container(
                        child: Icon(
                          Icons.add,
                          size: 40,
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.only(
                          right: displayWidth * 0.015,
                          left: displayWidth * 0.015,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            GestureDetector(
              onTap: () async {
                Directory appDocDir = await getApplicationDocumentsDirectory();
                String path = appDocDir.path;

                Map<String, dynamic> fileMap = {};
                var file = File('$path/cart.json');
                if(await file.exists()) {
                  fileMap = jsonDecode(await file.readAsString());
                }

                if(fileMap.containsKey("restaurante")) {
                  if(restaurantId != fileMap["restaurante"]) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext ctx){
                          return AlertDialog(
                            title: Text("Não é possível adicionar produtos de diferentes estabelecimentos"),
                            actions: <Widget>[
                              RaisedButton(
                                color: Colors.yellow,
                                child: Text("Cancelar"),
                                onPressed: (){
                                  Navigator.of(ctx).pop();
                                  Get.back();
                                },
                              ),
                              RaisedButton(
                                color: Colors.yellow,
                                child: Text("Ir para o carrinho"),
                                onPressed: (){
                                  Navigator.of(ctx).pop();
                                  Get.off(MyOrder());
                                },
                              ),
                            ],
                          );
                        }
                    );
                    return;
                  }
                }

                if(fileMap.containsKey("produtos")) {
                  Map<String, dynamic> productMap = fileMap["produtos"];
                  if(productMap.containsKey("$productId")) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext ctx){
                        return AlertDialog(
                          title: Text("Este produto já está no carrinho"),
                          actions: <Widget>[

                            RaisedButton(
                              color: Colors.yellow,
                              child: Text("Cancelar"),
                              onPressed: (){
                                Navigator.of(ctx).pop();
                                Get.back();
                              },
                            ),
                            RaisedButton(
                              color: Colors.yellow,
                              child: Text("Ir para o carrinho"),
                              onPressed: (){
                                Navigator.of(ctx).pop();
                                Get.off(MyOrder());
                              },
                            ),
                          ],
                        );
                      }
                    );
                    return;
                  }
                }

                fileMap.putIfAbsent("usuario", () => userId);
                fileMap.putIfAbsent("restaurante", () => restaurantId);
                fileMap.putIfAbsent("produtos", () => Map<String, dynamic>());

                Map<String, dynamic> productsMap = fileMap["produtos"];
                productsMap.putIfAbsent("$productId", () => Map<String, dynamic>());

                Map<String, dynamic> productMap = productsMap["$productId"];
                productMap.putIfAbsent("produto", () => productId);
                productMap["quantidade"] = produtCount;
                productMap.putIfAbsent("desconto", () => discount);
                productMap.putIfAbsent("categoria", () => categoryId);
                productMap.putIfAbsent("preco", () => price);

                var json = jsonEncode(fileMap);
                file.writeAsString(json);
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Adicionar ao carrinho".toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'BalooBhai',
                      color: Colors.white,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(
                  top: displayHeight * 0.02
                ),
                padding: EdgeInsets.only(
                  top: displayHeight * 0.003,
                  bottom: displayHeight * 0.003,
                ),
                width: displayWidth * 0.85,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
