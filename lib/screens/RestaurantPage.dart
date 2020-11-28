import 'package:flutter/material.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/widgets/RestaurantAll.dart';
import 'package:flutter_login/widgets/TopRestaurant.dart';

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            TopRestaurant(),
            RestaurantAll(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
