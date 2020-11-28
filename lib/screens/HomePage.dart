import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import '../widgets/RestaurantsWidget.dart';
import '../widgets/BottomNavBarWidget.dart';
import '../widgets/FoodPromosWidget.dart';
import '../widgets/SearchWidget.dart';
import '../widgets/CategoriesWidget.dart';
import '../widgets/Top.dart';
import '../widgets/BannerPromosWidget.dart';
import 'package:flutter_login/globals.dart';
import '../widgets/Filter.dart';
import '../widgets/Profile.dart';
import '../widgets/MyOrder.dart';
import '../widgets/Orders.dart';
import '../widgets/Chat.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Função para filtrar restaurantes por categoria
  filterRests(String categorySlug) async {
    var result = await firestore
        .collection('categorias')
        .where("slug", isEqualTo: categorySlug)
        .limit(1)
        .get();
    String categoryID =  result.docs.first.id;

    result = await firestore
        .collection('restaurantes-categorias')
        .where("category", isEqualTo: categoryID)
        .get();

    result.docs.forEach((doc) {
      print(doc.id);  // ID da relação
      firestore.collection('restaurantes').doc(doc["restaurant"]).get().then((value) => {
        print(value["name"])
      });
    }); // Restaurantes
  }

  getValues() {
    print(MediaQuery.of(context).viewPadding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, ScaleRoute(page: MyOrder()));
        },
        child: Icon(Icons.shopping_cart, color: Colors.white,),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            SizedBox(
              height: displayHeight * 0.01,
            ),
            Top(),
            FlatButton(
              onPressed: () => {
                filterRests("pizza")
              },
              child: Text(
                "Filter Rests",
              ),
            ),
            SearchWidget(),
            RaisedButton(
              child: Text(
                "Filtro",
              ),
              onPressed: (){
                Navigator.push(context, ScaleRoute(page: Filter()));
              },
            ),
            RaisedButton(
              child: Text(
                "Perfil",
              ),
              onPressed: (){
                Navigator.push(context, ScaleRoute(page: Profile()));
              },
            ),
            RaisedButton(
              child: Text(
                "Pedidos",
              ),
              onPressed: (){
                Navigator.push(context, ScaleRoute(page: Orders()));
              },
            ),
            RaisedButton(
              child: Text(
                "Chat",
              ),
              onPressed: (){
                Navigator.push(context, ScaleRoute(page: Chat()));
              },
            ),
            BannerPromosWidget(),
            CategoriesWidget(),
            FoodPromosWidget(),
            RestaurantsWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
