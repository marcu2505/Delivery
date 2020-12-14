import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/widgets/MyOrder.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OptionTile extends StatefulWidget{
  final String name;
  final List<dynamic> options;

  OptionTile({
    Key key,
    @required this.name,
    @required this.options,
  }) : super(key: key);

  @override
  _OptionTileState createState() => _OptionTileState(
      name: this.name, options: this.options);
}

class _OptionTileState extends State<OptionTile>{

  final String name;
  final List<dynamic> options;

  _OptionTileState({
    @required this.name,
    @required this.options,
  });

  bool select = true;
  
  @override
  
  Widget build(BuildContext context){
    return Container(
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
                    name.toUpperCase(),
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontFamily: 'BalooBhai',
                        fontWeight: FontWeight.w300),
                  ),
                  this.select
                      ? Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 35,
                  )
                      : Icon(
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
          !this.select
            ? OptionItemsList(
              options: this.options,
            ): Container(),
        ],
      ),
    );
  }
}

class OptionItemsList extends StatelessWidget {
  final List<dynamic> options;

  OptionItemsList({
    @required this.options,
  });

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    options.forEach((item) {
      return Container(
        color: Colors.red,
        child: Text(
          item
        ),
      );
    });
  }
}

class OptionList extends StatelessWidget {
  final String productId;
  final String restaurantId;
  final String categoryId;
  
  OptionList({
    @required this.restaurantId,
    @required this.categoryId,
    @required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('restaurantes').doc(this.restaurantId)
          .collection('categorias').doc(this.categoryId)
          .collection('produtos').doc(this.productId)
          .collection('opcoes')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text("Carregando dados...");
        return new ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: snapshot.data.docs.map((options) {
            return new OptionTile(
              name: options.data()["nome"],
              options: options.data()["opcoes"],
            );
          }).toList(),
        );
      },
    );
  }
}

class Details extends StatefulWidget {

  final String productId;
  final String userId;
  final String restaurantId;
  final String categoryId;
  final String name;
  final String observation;
  final double discount;
  final double price;
  final int quantity;
  final bool onCart;

  @override

  _DetailsState createState() => _DetailsState(
    restaurantId: this.restaurantId,
    categoryId: this.categoryId,
    productId: this.productId,
    discount: this.discount,
    userId: this.userId,
    price: this.price,
    name: this.name,
    observation: this.observation,
    onCart: this.onCart,
    quantity: this.quantity,
  );
  Details({
    @required this.productId,
    @required this.categoryId,
    @required this.restaurantId,
    @required this.price,
    @required this.discount,
    @required this.userId,
    @required this.name,
    this.quantity = 1,
    this.observation,
    this.onCart,
  });
}

class _DetailsState extends State<Details> {

  final String productId;
  final String userId;
  final String restaurantId;
  final String categoryId;
  final String name;
  final String observation;
  final double discount;
  final double price;
  int quantity;
  final bool onCart;

  _DetailsState({
    @required this.productId,
    @required this.categoryId,
    @required this.restaurantId,
    @required this.price,
    @required this.discount,
    @required this.userId,
    @required this.name,
    this.quantity = 1,
    this.observation,
    this.onCart,
  });

  TextEditingController observationController = new TextEditingController();

  bool select = true;

  @override
  Widget build(BuildContext context) {
    observationController.text = this.observation;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OptionList(restaurantId: this.restaurantId, categoryId: this.categoryId, productId: this.productId),
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
                        controller: observationController,
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
                        if(this.quantity > 1){
                          setState(() {
                            this.quantity--;
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
                        this.quantity.toString(),
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
                        if (this.quantity < 99) {
                          setState(() {
                            this.quantity++;
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
                                  Get.off(MyOrder(restaurantId: this.restaurantId));
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
                  if(productMap.containsKey("$productId") && (onCart != true)){
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
                                // Navigator.of(ctx).pop();
                                Get.off(MyOrder(restaurantId: this.restaurantId));
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
                productMap["quantidade"] = this.quantity;
                productMap.putIfAbsent("desconto", () => discount);
                productMap.putIfAbsent("categoria", () => categoryId);
                productMap.putIfAbsent("preco", () => price);
                productMap.putIfAbsent("nome", () => name);
                productMap["observacao"] = observationController.text;


                var json = jsonEncode(fileMap);
                file.writeAsString(json);

                Get.off(MyOrder(restaurantId: this.restaurantId));
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
