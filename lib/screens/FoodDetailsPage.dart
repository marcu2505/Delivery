import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/widgets/Topdetail.dart';
import 'package:flutter_login/widgets/Details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodDetailsPage extends StatefulWidget {
  final String productId;
  final String categoryId;
  final String imageUrl;
  final String restaurantId;
  final String name;
  final String observation;
  final double discount;
  final double price;
  final int quantity;
  final bool onCart;

  FoodDetailsPage({
    @required this.productId,
    @required this.categoryId,
    @required this.imageUrl,
    @required this.restaurantId,
    @required this.discount,
    @required this.price,
    @required this.name,
    this.quantity = 1,
    this.observation,
    this.onCart,
  });

  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState(
    productId: this.productId,
    categoryId: this.categoryId,
    imageUrl: this.imageUrl,
    restaurantId: this.restaurantId,
    userId: FirebaseAuth.instance.currentUser.uid,
    price: this.price,
    discount: this.discount,
    name: this.name,
    observation: this.observation,
    quantity: this.quantity,
    onCart: this.onCart
  );
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  final String productId;
  final String categoryId;
  final String imageUrl;
  final String restaurantId;
  final String userId;
  final String name;
  final String observation;
  final double discount;
  final double price;
  final int quantity;
  final bool onCart;

  _FoodDetailsPageState({
    @required this.productId,
    @required this.categoryId,
    @required this.imageUrl,
    @required this.restaurantId,
    @required this.userId,
    @required this.discount,
    @required this.price,
    @required this.name,
    this.observation,
    this.onCart,
    this.quantity = 1,
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
            TopDetail(productId: this.productId, categoryId: this.categoryId, imageUrl: this.imageUrl, restaurantId: this.restaurantId, price: this.price),
            Details(
              productId: this.productId,
              categoryId: this.categoryId,
              restaurantId: this.restaurantId,
              price: this.price,
              discount: this.discount,
              userId: this.userId,
              name: this.name,
              observation: this.observation,
              quantity: this.quantity,
              onCart: this.onCart,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
