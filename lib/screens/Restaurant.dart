import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/RestaurantAll.dart';
import '../widgets/BottomNavBarWidget.dart';
import '../widgets/TopRestaurant.dart';

class Restaurant extends StatefulWidget {
  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  getValues() {
    print(MediaQuery
        .of(context)
        .viewPadding);
  }

  @override
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
