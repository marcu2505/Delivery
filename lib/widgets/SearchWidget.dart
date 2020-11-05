import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/globals.dart';

class SearchWidget extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: displayWidth * 0.08,
        top: displayHeight * 0.01,
        right: displayWidth * 0.08,
        bottom: displayHeight * 0.02,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          cursorColor: Colors.grey,
          primaryColor: Colors.white,
        ),
        child: Material(
          elevation: 7.0,
          shadowColor: Colors.grey,
          borderRadius: const BorderRadius.all(
            const Radius.circular(20.0),
          ),
          child: Container(
            height: displayHeight * 0.06,
            child:TextField(
              textAlignVertical: TextAlignVertical.center,
              autofocus: false,
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  ),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),
                  ),

                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),
                  ),
                ),
                prefixIcon: Icon(Icons.search,color: Colors.red,),
                fillColor: Colors.white,
                hintStyle: new TextStyle(color: Colors.grey, fontSize: 18.0),
                hintText: "O que você procura?",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
