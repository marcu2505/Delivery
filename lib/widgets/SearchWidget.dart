import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWidget extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.08,
        top: MediaQuery.of(context).size.height * 0.01,
        right: MediaQuery.of(context).size.width * 0.08,
        bottom: MediaQuery.of(context).size.height * 0.02,
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
            height: MediaQuery.of(context).size.height * 0.06,
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
