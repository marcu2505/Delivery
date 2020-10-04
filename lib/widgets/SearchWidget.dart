import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 5),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/img/logo.png',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          //fillColor: Color(0xFFFAFAFA),

          suffixIcon: Icon(Icons.search,color: Colors.red,),
          hintStyle: new TextStyle(color: Colors.grey, fontSize: 18),
          hintText: "O que você quer comer hoje?",
        ),
      ),
    );
  }
}
