import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 24,
                  ),
                  SizedBox(
                    width: displayWidth * 0.02,
                  ),
                  Text(
                    "ALGUMA OBSERVAÇÃO?",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'BalooBhai',
                    ),
                  )
                ]
            ),
            Center(
              child: Padding(
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
                    color: Colors.white,
                    elevation: 7.0,
                    shadowColor: Colors.grey,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                    child: Container(
                      height: displayHeight * 0.10,
                      child:TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 2,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.grey, fontFamily: 'BalooBhai',),
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
                          fillColor: Colors.white,
                          hintStyle: new TextStyle(color: Colors.grey, fontSize: 18.0, fontFamily: 'BalooBhai',),
                          hintText: "Ex.: Sem cebola e ovo",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: displayHeight * 0.02,
                //bottom: displayHeight * 0.01,
              ),
              child: Center(
                child: Text(
                  "Quantidade".toUpperCase(),
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'BalooBhai',
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.remove,
                        size: 40,
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.only(
                        right: displayWidth * 0.015,
                        left: displayWidth * 0.015,
                      ),
                      margin: EdgeInsets.only(
                        right: displayWidth * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "1".toUpperCase(),
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'BalooBhai',
                        ),
                      ),
                      margin: EdgeInsets.only(
                        right: displayWidth * 0.02,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.only(
                        right: displayWidth * 0.015,
                        left: displayWidth * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "Adicionar ao carrinho".toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'BalooBhai',
                    color: Colors.white,
                  ),
                ),
              ),
              margin: EdgeInsets.only(
                top: displayHeight * 0.02
              ),
              width: displayWidth * 0.85,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ],
        )
    );
  }
}
