import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/animation/ScaleRoute.dart';
import 'package:flutter_login/widgets/RestaurantsWidget.dart';
import 'package:flutter_login/widgets/FoodPromosWidget.dart';
import 'package:flutter_login/widgets/SearchWidget.dart';
import 'package:flutter_login/widgets/CategoriesWidget.dart';
import 'package:flutter_login/widgets/Top.dart';
import 'package:flutter_login/widgets/BannerPromosWidget.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/widgets/Chat.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
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

  void aaa() async {
    var imageURL = FirebaseStorage.instance.ref().child('restaurantes/').child('4XUd4MIdBZJQOC8hxSYF/').child('image.jpg');
    print(imageURL);
    print(await imageURL.getDownloadURL());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Top(),
          SearchWidget(),
          RaisedButton(
            child: Text(
              "AAA",
            ),
            onPressed: aaa,
          ),
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
          // RaisedButton(
          //   child: Text(
          //     "Chat",
          //   ),
          //   onPressed: (){
          //     Navigator.push(context, ScaleRoute(page: Chat()));
          //   },
          // ),
          // RaisedButton(
          //   child: Text(
          //     "Notificação",
          //   ),
          //   onPressed: (){
          //     //Navigator.push(context, ScaleRoute(page: MessagingWidget("")));
          //   },
          // ),
          BannerPromosWidget(),
          CategoriesWidget(),
          FoodPromosWidget(),
          RestaurantsWidget(),
        ],
      ),
    );
  }
}
