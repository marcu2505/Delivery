import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/RestaurantAll.dart';
import '../animation/ScaleRoute.dart';
import '../widgets/BestRestaurantsWidget.dart';
import '../widgets/BottomNavBarWidget.dart';
import '../widgets/PopularFoodsWidget.dart';
import '../widgets/SearchWidget.dart';
import '../widgets/TopMenus.dart';
import '../widgets/Top.dart';
import '../widgets/PromoWidget.dart';
import '../widgets/TopRestaurant.dart';

class Restaurant extends StatefulWidget {
  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  getValues() {
    print(MediaQuery
        .of(context)
        .viewPadding);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .viewPadding
                  .top,
            ),

            TopRestaurant(),
            RestaurantAll(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
