import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/Restaurant.dart';
import '../animation/ScaleRoute.dart';

class TopDetail extends StatefulWidget {
  @override
  _TopDetailState createState() => _TopDetailState();
}

class _TopDetailState extends State<TopDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                'https://vikingsbr.com/wp-content/uploads/2019/11/BANNER_BLOG_PENEDO-2.png',
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 5, bottom: 5),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Card(
                    //semanticContainer: true,
                    color: Colors.yellow,
                    //clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //elevation: 1,
                    margin: EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 0,
                      bottom: 0,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 5,
                        bottom: 8,
                        right: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Text("CHEESE BURGUER".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontFamily: 'BalooBhai',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("PÃO, CARNE E QUEIJO",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'BalooBhai',
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.only(
                                          //left: 5,
                                          right: 5,
                                        ),
                                        margin: EdgeInsets.only(
                                          right: 5,
                                          //bottom: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("R\$ 32.00",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'BalooBhai',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                        ),
                                        margin: EdgeInsets.only(
                                          right: 5,
                                          bottom: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
