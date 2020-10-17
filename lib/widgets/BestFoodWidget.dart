import 'package:flutter/material.dart';

class BestFoodWidget extends StatefulWidget {
  @override
  _BestFoodWidgetState createState() => _BestFoodWidgetState();
}

class _BestFoodWidgetState extends State<BestFoodWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          BestFoodTitle(),
          BestFoodList(),
        ],
      ),
    );
  }
}

class BestFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Estabelecimentos",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class BestFoodTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  String price;
  String slug;
  String adress;
  String category;

  BestFoodTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.rating,
      @required this.numberOfRating,
      @required this.price,
      @required this.slug,
      @required this.adress,
      @required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(boxShadow: [

            ]),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(
                        imageUrl,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.height * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 21,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                category,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                    ),
                                    Text(
                                      rating,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            adress,
                          ),
                          Text(
                            "Frete grátis",
                          )
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
}

class BestFoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        BestFoodTiles(
            name: "Quinta avenida",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: '4.9',
            numberOfRating: '200',
            price: '\$\$\$',
            slug: "fried_egg",
            category: "Marmitex",
            adress: "Rua Vaz de Melo, 102"),
        BestFoodTiles(
            name: "Nova Opção",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.9",
            numberOfRating: "100",
            price: '\$\$',
            slug: "",
            category: "Almoço",
            adress: "Rua Helena Silva, 22"),
        BestFoodTiles(
            name: "Edd's burguer",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.0",
            numberOfRating: "50",
            price: '\$\$\$',
            slug: "",
            category: "Hamburguer",
            adress: "Avenida Braga Viana, 1092"),
        BestFoodTiles(
            name: "Açaí da praça",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.00",
            numberOfRating: "100",
            price: '\$',
            slug: "",
            category: "Açaí",
            adress: "Rua Iolanda Barbosa, 879"),
        BestFoodTiles(
            name: "Subway",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$',
            slug: "",
            category: "Sanduíche",
            adress: "Avenida Vine Nigo"),
        BestFoodTiles(
            name: "Burger King",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.00",
            numberOfRating: "100",
            price: '\$\$\$',
            slug: "",
            category: "Hamburguer",
            adress: "Rua New York, 666"),
        BestFoodTiles(
            name: "Pais e Filhos",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.2",
            numberOfRating: "70",
            price: '\$',
            slug: "",
            category: "Sorveteria",
            adress: "Avenida Paraguai, 54"),
        BestFoodTiles(
            name: "Spolleto",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: '4.9',
            numberOfRating: '200',
            price: '\$',
            slug: "",
            category: "Italiana",
            adress: "Rua Visconde Jonas, 671"),
        BestFoodTiles(
            name: "Refrescar",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$',
            slug: "",
            category: "Bebidas",
            adress: "Rua Bruna Gaules, 681"),
        BestFoodTiles(
            name: "Natureba",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$\$',
            slug: "",
            category: "Almoço",
            adress: "Rua Bosco Vini, 98"),
        BestFoodTiles(
            name: "Aviões da grelha",
            imageUrl: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
            rating: "4.6",
            numberOfRating: "150",
            price: '\$\$',
            slug: "",
            category: "Carne",
            adress: "Rua Eni Moura, 128"),
      ],
    );
  }
}
