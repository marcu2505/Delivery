import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../screens/Restaurant.dart';
import '../animation/ScaleRoute.dart';

class RestaurantAll extends StatefulWidget {
  @override
  _RestaurantAllState createState() => _RestaurantAllState();
}

class _RestaurantAllState extends State<RestaurantAll> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          BestRestaurantsTitle(),
          BestRestaurantsList(),
        ],
      ),
    );
  }
}

class BestRestaurantsTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 0,
          ),
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Açaí",
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 35,
                    ),
                  ],
                ),
                width: displayWidth * 0.94,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 0,
          ),
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Hamburguer",
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 35,
                    ),
                  ],
                ),
                width: displayWidth * 0.94,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 0,
          ),
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Pizza",
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 35,
                    ),
                  ],
                ),
                width: displayWidth * 0.94,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BestRestaurantsTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  String price;
  String slug;
  String address;
  String category;
  double deliveryFee;

  BestRestaurantsTiles(
      {Key key,
        @required this.name,
        @required this.imageUrl,
        @required this.rating,
        @required this.numberOfRating,
        @required this.price,
        @required this.slug,
        @required this.address,
        @required this.category,
        @required this.deliveryFee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, ScaleRoute(page: Restaurant()));
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 2.5, bottom: 2.5),
            decoration: BoxDecoration(
              //color: Colors.black,
            ),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              margin: EdgeInsets.only(
                left: 5,
                right: 5,
                top: 0,
                bottom: 0,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 20,
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
                                child: Text(name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontFamily: 'BalooBhai',
                                  ),
                                ),

                              ),
                              Container(
                                child: Text("R\$ " + rating.toUpperCase() + "0",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'BalooBhai',
                                    color: Colors.white,
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                  top: 2,
                                  bottom: 2,
                                  left: 5,
                                  right: 5,
                                ),
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            //height: displayHeight * 0.008,
                          ),
                          Text("Pão carne e queijo batata arroz salada".toUpperCase(),
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'BalooBhai',
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
    );
  }

  Text getDeliveryFee(double deliveryFee) {
    String text = "FRETE GRÁTIS";
    double textSize = 14.6;
    if(deliveryFee.round() > 0) {
      text = "R\$ " + deliveryFee.toStringAsFixed(2);
      textSize = 14.6;
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        color: Colors.yellow,
        fontFamily: 'BalooBhai',
      ),
    );
  }
}

class BestRestaurantsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        BestRestaurantsTiles(
            name: "QUINTA AVENIDA",
            imageUrl: "https://upload.wikimedia.org/wikipedia/pt/thumb/c/cf/Logotipo_do_Burger_King.svg/600px-Logotipo_do_Burger_King.svg.png",
            rating: '4.9',
            numberOfRating: '200',
            price: '\$\$\$',
            slug: "fried_egg",
            category: "MARMITEX",
            address: "Rua Vaz de Melo, 102",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Nova Opção",
            imageUrl: "https://upload.wikimedia.org/wikipedia/pt/thumb/b/bf/KFC_logo.svg/1024px-KFC_logo.svg.png",
            rating: "4.9",
            numberOfRating: "100",
            price: '\$\$',
            slug: "",
            category: "ALMOÇO",
            address: "Rua Helena Silva, 22",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Edd's burguer",
            imageUrl: "https://static-images.ifood.com.br/image/upload//logosgde/e8813e59-7284-4139-b86d-1c5e221822d4/202005231752_rKMI_i.png",
            rating: "4.0",
            numberOfRating: "50",
            price: '\$\$\$',
            slug: "",
            category: "Hamburguer",
            address: "Avenida Braga Viana, 1092",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Açaí da praça",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.0",
            numberOfRating: "100",
            price: '\$',
            slug: "",
            category: "Açaí",
            address: "Rua Iolanda Barbosa, 879",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Subway",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$',
            slug: "",
            category: "Sanduíche",
            address: "Avenida Vine Nigo",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Burger King",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.0",
            numberOfRating: "100",
            price: '\$\$\$',
            slug: "",
            category: "Hamburguer",
            address: "Rua New York, 666",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Pais e Filhos",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.2",
            numberOfRating: "70",
            price: '\$',
            slug: "",
            category: "Sorveteria",
            address: "Avenida Paraguai, 54",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Spolleto",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: '4.9',
            numberOfRating: '200',
            price: '\$',
            slug: "",
            category: "Italiana",
            address: "Rua Visconde Jonas, 671",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Refrescar",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$',
            slug: "",
            category: "Bebidas",
            address: "Rua Bruna Gaules, 681",
            deliveryFee: 4.99),
        BestRestaurantsTiles(
            name: "Natureba",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$\$',
            slug: "",
            category: "Almoço",
            address: "Rua Bosco Vini, 98",
            deliveryFee: 4.99),
        BestRestaurantsTiles(
            name: "Aviões da grelha",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$',
            slug: "",
            category: "Carne",
            address: "Rua Eni Moura, 128",
            deliveryFee: 4.99),
        BestRestaurantsTiles(
            name: "Quinta avenida",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: '4.9',
            numberOfRating: '200',
            price: '\$\$\$',
            slug: "fried_egg",
            category: "Marmitex",
            address: "Rua Vaz de Melo, 102",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Nova Opção",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.9",
            numberOfRating: "100",
            price: '\$\$',
            slug: "",
            category: "Almoço",
            address: "Rua Helena Silva, 22",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Edd's burguer",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.0",
            numberOfRating: "50",
            price: '\$\$\$',
            slug: "",
            category: "Hamburguer",
            address: "Avenida Braga Viana, 1092",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Açaí da praça",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.0",
            numberOfRating: "100",
            price: '\$',
            slug: "",
            category: "Açaí",
            address: "Rua Iolanda Barbosa, 879",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Subway",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$',
            slug: "",
            category: "Sanduíche",
            address: "Avenida Vine Nigo",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Burger King",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.0",
            numberOfRating: "100",
            price: '\$\$\$',
            slug: "",
            category: "Hamburguer",
            address: "Rua New York, 666",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Pais e Filhos",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.2",
            numberOfRating: "70",
            price: '\$',
            slug: "",
            category: "Sorveteria",
            address: "Avenida Paraguai, 54",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Spolleto",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: '4.9',
            numberOfRating: '200',
            price: '\$',
            slug: "",
            category: "Italiana",
            address: "Rua Visconde Jonas, 671",
            deliveryFee: 0.00),
        BestRestaurantsTiles(
            name: "Refrescar",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$',
            slug: "",
            category: "Bebidas",
            address: "Rua Bruna Gaules, 681",
            deliveryFee: 4.99),
        BestRestaurantsTiles(
            name: "Natureba",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$\$',
            slug: "",
            category: "Almoço",
            address: "Rua Bosco Vini, 98",
            deliveryFee: 4.99),
        BestRestaurantsTiles(
            name: "Aviões da grelha",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$',
            slug: "",
            category: "Carne",
            address: "Rua Eni Moura, 128",
            deliveryFee: 4.99),
      ],
    );
  }
}
