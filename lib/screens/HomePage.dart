import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/screens/FilterPage.dart';
import 'package:flutter_login/screens/OrdersPage.dart';
import 'package:flutter_login/screens/ProfilePage.dart';
import 'package:flutter_login/widgets/GooglePay.dart';
import 'package:flutter_login/widgets/RestaurantsWidget.dart';
import 'package:flutter_login/widgets/FoodPromosWidget.dart';
import 'package:flutter_login/widgets/SearchWidget.dart';
import 'package:flutter_login/widgets/CategoriesWidget.dart';
import 'package:flutter_login/widgets/Top.dart';
import 'package:flutter_login/widgets/BannerPromosWidget.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/widgets/MyOrder.dart';
import 'package:flutter_login/widgets/Chat.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          // RaisedButton(
          //   child: Text(
          //     "Usuário Autenticado?",
          //   ),
          //   onPressed: () async {
          //     var user = FirebaseAuth.instance.currentUser;
          //     user.reload();
          //     user.emailVerified ? print("Email autenticado") : print("Email não autenticado");
          //     print(user.email + " " + user.emailVerified.toString());
          //   },
          // ),
          // RaisedButton(
          //   child: Text(
          //     "Enviar Email",
          //   ),
          //   onPressed: () async {
          //     var user = FirebaseAuth.instance.currentUser;
          //     await user.sendEmailVerification();
          //     print("Email enviado!");
          //   },
          // ),
          // RaisedButton(
          //   child: Text(
          //     "Teste Usuário",
          //   ),
          //   onPressed: () async {
          //     var user = FirebaseAuth.instance.currentUser;
          //     print(user.toString());
          //   },
          // ),
          // RaisedButton(
          //   child: Text(
          //     "Atualiza Usuário",
          //   ),
          //   onPressed: () async {
          //     var user = FirebaseAuth.instance.currentUser;
          //     user.updateProfile(
          //         displayName: "Victor Hugo",
          //         photoURL: "https://randomuser.me/api/portraits/men/99.jpg"
          //     );
          //   },
          // ),
          RaisedButton(
            child: Text(
              "Chat",
            ),
            onPressed: (){
              Navigator.push(context, ScaleRoute(page: Chat()));
            },
          ),
          RaisedButton(
            child: Text(
              "Google pay",
            ),
            onPressed: (){
             // Navigator.push(context, ScaleRoute(page: GooglePay()));
            },
          ),
          BannerPromosWidget(),
          CategoriesWidget(),
          FoodPromosWidget(),
          RestaurantsWidget(),
        ],
      ),
    );
  }
}
