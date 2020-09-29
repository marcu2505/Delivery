import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.local_pizza,
          ),
        ],
      ),
    );
  }
}