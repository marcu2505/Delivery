import 'package:flutter/material.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/widgets/RestaurantAll.dart';
import 'package:flutter_login/widgets/TopRestaurant.dart';

class RestaurantPage extends StatefulWidget {
  final String id;
  RestaurantPage({@required this.id});
  @override
  _RestaurantPageState createState() => _RestaurantPageState(id: this.id);
}

class _RestaurantPageState extends State<RestaurantPage> {
  final String id;
  _RestaurantPageState({@required this.id});
  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            TopRestaurant(id: this.id),
            RestaurantAll(id: this.id),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
