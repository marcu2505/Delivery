import 'package:flutter/material.dart';
import '../animation/ScaleRoute.dart';
import '../widgets/BestFoodWidget.dart';
import '../widgets/BottomNavBarWidget.dart';
import '../widgets/PopularFoodsWidget.dart';
import '../widgets/SearchWidget.dart';
import '../widgets/TopMenus.dart';
import '../widgets/PromoWidget.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            SearchWidget(),
            Promo(),
            TopMenus(),
            PopularFoodsWidget(),
            BestFoodWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
