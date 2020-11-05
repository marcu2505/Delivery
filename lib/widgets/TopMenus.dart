import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class TopMenusTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 3,
      ),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
            child: Text(
              "Categorias",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'BalooBhai',
                  fontWeight: FontWeight.w300
              ),
            ),
            decoration: BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TopMenusTitle(),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                // TopMenuTiles(
                //     name: "Burger",
                //     icon: "https://img2.gratispng.com/20181130/coc/kisspng-cheeseburger-buffalo-burger-hamburger-flip-burger-the-yummies-flip-burger-eat-burger-not-burgrrr-5c00e4ec8e06b2.8138792315435624765818.jpg",
                //     slug: ""),
                TopMenuTiles(
                    name: "Sushi",
                    icon: "https://www.restaurantesalute.com.br/wp-content/uploads/2020/07/sushi.png",
                    slug: ""),
                TopMenuTiles(
                    name: "Pizza",
                    icon: "http://www.operapizzaria.com.br/wp-content/uploads/2018/10/pizzatrad1-1-300x294.png",
                    slug: ""),
                TopMenuTiles(
                    name: "Açaí",
                    icon: "https://www.alphagel.com.br/wp-content/uploads/2017/09/a%C3%A7a%C3%AD-278x300.png",
                    slug: ""),
                TopMenuTiles(
                    name: "Marmita",
                    icon: "http://amarmitaria.com.br/wp-content/uploads/2017/03/marmitex.png",
                    slug: ""),
                TopMenuTiles(
                    name: "Brasileira",
                    icon: "https://i.ibb.co/RCDdG6t/brasileira.png",
                    slug: ""),
                // TopMenuTiles(
                //     name: "Carnes",
                //     icon: "https://w7.pngwing.com/pngs/914/939/png-transparent-roasted-beef-food-beef-roasted-beef.png",
                //     slug: ""),
                // TopMenuTiles(
                //     name: "Doces e bolos",
                //     icon: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
                //     slug: ""),
                TopMenuTiles(
                    name: "Saudável",
                    icon: "https://www.restaurantesalute.com.br/wp-content/uploads/2019/10/BK_Web_ENSALADA_ORIGINAL_500X540px_0.png",
                    slug: ""),
                // TopMenuTiles(
                //     name: "Italiana",
                //     icon: "https://fresh.co.nz/wp-content/uploads/2020/03/Fried-Eggs-5-Ways_LR-e1583270528321.jpg",
                //     slug: ""),
                TopMenuTiles(
                    name: "Fast Food",
                    icon: "https://i.ibb.co/2KQYPqn/fast-food-1.png",
                    slug: ""),
                TopMenuTiles(
                    name: "Bebidas",
                    icon: "https://i.dlpng.com/static/png/6590390_preview.png",
                    slug: ""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  String name;
  String icon;
  String slug;

  TopMenuTiles(
      {Key key,
      @required this.name,
      @required this.icon,
      @required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 4,
            ),
            padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 0),
            child: Card(
                color: Colors.yellow,
                elevation: 0,
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    child: Center(
                      child: Image.network(
                        icon,
                      ),
                    ),
                  ),
                ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                name.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6e6e71),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'BalooBhai',
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 4,
            ),
          ),
        ],
      ),
    );
  }
}
