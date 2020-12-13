import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/CategoriesWidget.dart';
import 'package:flutter_login/widgets/RestaurantsWidget.dart';
import 'package:flutter_login/widgets/SearchWidget.dart';
import 'package:flutter_login/widgets/Top.dart';

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
          // BannerPromosWidget(), TODO
          CategoriesWidget(),
          // FoodPromosWidget(), TODO
          RestaurantsWidget(),
        ],
      ),
    );
  }
}
