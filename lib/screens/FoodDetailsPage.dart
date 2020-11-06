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
import '../widgets/Topdetail.dat.dart';
import '../widgets/Details.dart';

class FoodDetailsPage extends StatefulWidget {
  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.shopping_cart, color: Colors.white,),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .viewPadding
                  .top,
            ),
            TopDetail(),
            Details(),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
