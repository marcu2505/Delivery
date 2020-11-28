import 'package:flutter/material.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:flutter_login/widgets/Topdetail.dart';
import 'package:flutter_login/widgets/Details.dart';

class FoodDetailsPage extends StatefulWidget {
  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Layout.render(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.shopping_cart, color: Colors.white,),
        backgroundColor: Colors.red,
      ),
      content: SingleChildScrollView(
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
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
