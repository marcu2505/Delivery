
import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';

class TopRestaurant extends StatefulWidget {
  @override
  _TopRestaurantState createState() => _TopRestaurantState();
}

class _TopRestaurantState extends State<TopRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: displayHeight * 0.25,
              width: displayWidth,
              child: Image.network(
                'https://vikingsbr.com/wp-content/uploads/2019/11/BANNER_BLOG_PENEDO-2.png',
                height: displayHeight * 0.25,
                width: displayWidth,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://cdn.pixabay.com/photo/2013/07/13/10/22/star-157086_1280.png',
                      width: 20,
                      height: 20,
                    ),
                    Text("4.9",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'BalooBhai',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(
                  left: 7,
                  right: 7,
                ),
                margin: EdgeInsets.only(
                  top: displayHeight * 0.23,
                  left: displayWidth * 0.10,
                ),
                height: displayHeight * 0.04,
                width: displayWidth * 0.18,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),

            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 5, bottom: 5),
                  margin: EdgeInsets.only(
                    top: displayHeight * 0.275,
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
                                      child: Text("Delivery Regional".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 22.3,
                                          fontFamily: 'BalooBhai',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  //height: displayHeight * 0.008,
                                ),
                                Container(
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                size: 14,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: displayWidth * 0.01,
                                              ),
                                              Text("40 - 45Min",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'BalooBhai',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                         decoration: BoxDecoration(
                                           color: Colors.red,
                                           borderRadius: BorderRadius.all(
                                             Radius.circular(5),
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
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.attach_money,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: displayWidth * 0.01,
                                            ),
                                            Text("Pedido mínimo: R\$25.00",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'BalooBhai',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
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
                                      Container(
                                        child: Icon(
                                          Icons.add_circle_outline,
                                          size: 27,
                                        ),
                                        margin: EdgeInsets.only(
                                          //right: 5,
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
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                child: Image.network(
                  'https://img.elo7.com.br/product/original/2E973A3/logotipo-personalizada-restaurante-arte-digital-restaurante.jpg',
                  fit: BoxFit.cover,
                ),
                margin: EdgeInsets.only(
                  top: displayHeight * 0.185,
                  left: displayWidth * 0.7,
                ),
                height: displayHeight * 0.12,
                width: displayWidth * 0.25,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
