import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[

          RaisedButton(
            onPressed: (){},
            elevation: 2.0,
            color: Colors.white,
            child: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}