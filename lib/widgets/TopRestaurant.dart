import 'package:flutter/material.dart';
import 'package:flutter_login/entity/restaurant.dart';
import 'package:flutter_login/globals.dart';

class TopRestaurant extends StatefulWidget {
  final Restaurant restaurant;
  TopRestaurant({@required this.restaurant});

  @override
  _TopRestaurantState createState() =>
      _TopRestaurantState(restaurant: this.restaurant);
}

class _TopRestaurantState extends State<TopRestaurant> {
  final Restaurant restaurant;
  _TopRestaurantState({@required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopTile(
          name: this.restaurant.name,
          imageURL: this.restaurant.imageURL,
          rating: 4.7,
          numberOfRating: 200,
          price: "\$\$\$",
          address: this.restaurant.address,
          category: this.restaurant.mainCategory,
          coverURL: this.restaurant.coverURL,
          minDeliveryTime: this.restaurant.minDeliveryTime,
          maxDeliveryTime: this.restaurant.maxDeliveryTime,
          minOrderPrice: this.restaurant.minOrderPrice,
          deliveryFee: this.restaurant.deliveryFee,
        )
      ],
    );
  }
}

class TopTile extends StatelessWidget {
  final String name;
  final String imageURL;
  final String price;
  final String address;
  final String category;
  final String coverURL;
  final double rating;
  final double deliveryFee;
  final int numberOfRating;
  final int minDeliveryTime;
  final int maxDeliveryTime;
  final double minOrderPrice;

  TopTile({
    @required this.name,
    @required this.imageURL,
    @required this.rating,
    @required this.numberOfRating,
    @required this.price,
    @required this.address,
    @required this.category,
    @required this.coverURL,
    @required this.minDeliveryTime,
    @required this.maxDeliveryTime,
    @required this.minOrderPrice,
    @required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: displayHeight * 0.25,
          width: displayWidth,
          child: Image.network(
            this.coverURL,
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
                Text(
                  this.rating.toStringAsPrecision(1),
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
                                child: Text(
                                  this.name.toUpperCase(),
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
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: displayWidth * 0.01,
                                      ),
                                      Text(
                                        "${this.minDeliveryTime} - ${this.maxDeliveryTime} Min",
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.attach_money,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: displayWidth * 0.01,
                                      ),
                                      Text(
                                        "Pedido mínimo: R\$${this.minOrderPrice.toStringAsFixed(2)}",
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
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.network(
                this.imageURL,
                fit: BoxFit.cover,
              ),
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
    );
  }
}
