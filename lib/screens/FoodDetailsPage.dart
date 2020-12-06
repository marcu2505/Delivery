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
  final double discount;
  final double price;

  FoodDetailsPage({
    @required this.productId,
    @required this.categoryId,
    @required this.imageUrl,
    @required this.restaurantId,
    @required this.discount,
    @required this.price,
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
  );
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  final String productId;
  final String categoryId;
  final String imageUrl;
  final String restaurantId;
  final String userId;
  final double discount;
  final double price;

  _FoodDetailsPageState({
    @required this.productId,
    @required this.categoryId,
    @required this.imageUrl,
    @required this.restaurantId,
    @required this.userId,
    @required this.discount,
    @required this.price,
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
            Details(productId: this.productId, categoryId: this.categoryId, restaurantId: this.restaurantId, price: this.price, discount: this.discount, userId: this.userId),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
