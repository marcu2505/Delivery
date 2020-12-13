import 'package:flutter/material.dart';
import 'package:flutter_login/entity/restaurant.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/widgets/RestaurantAll.dart';
import 'package:flutter_login/widgets/TopRestaurant.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantPage({@required this.restaurant});

  @override
  _RestaurantPageState createState() =>
      _RestaurantPageState(restaurant: this.restaurant);
}

class _RestaurantPageState extends State<RestaurantPage> {
  final Restaurant restaurant;
  _RestaurantPageState({@required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            TopRestaurant(restaurant: this.restaurant),
            RestaurantAll(restaurant: this.restaurant),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
