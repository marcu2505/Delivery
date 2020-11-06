import 'package:flutter/material.dart';
import '../animation/ScaleRoute.dart';
import '../widgets/BestRestaurantsWidget.dart';
import '../widgets/BottomNavBarWidget.dart';
import '../widgets/PopularFoodsWidget.dart';
import '../widgets/SearchWidget.dart';
import '../widgets/TopMenus.dart';
import '../widgets/Top.dart';
import '../widgets/PromoWidget.dart';
import '../widgets/MyOrder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override

  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  getValues() {
    print(MediaQuery.of(context).viewPadding);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, ScaleRoute(page: MyOrder()));
        },
        child: Icon(Icons.shopping_cart, color: Colors.white,),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Top(),
            SearchWidget(),
            Promo(),
            TopMenus(),
            PopularFoodsWidget(),
            BestRestaurantsWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
