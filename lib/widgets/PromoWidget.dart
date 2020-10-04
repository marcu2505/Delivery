import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_login/constants.dart';

class Promo extends StatefulWidget {
  @override
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<Promo> {

  List<String> images = [
    'https://observatoriodatv.uol.com.br/wp-content/uploads/2020/05/Floribella-de-volta-na-Band-1.gif',
    'https://observatoriodatv.uol.com.br/wp-content/uploads/2020/05/Juliana-Silveira-%C3%A9-a-protagonista-de-Floribella-na-Band.jpg',
    'https://i0.wp.com/portalovertube.com/wp-content/uploads/2020/05/Floribella.png',
    'https://tvefamosos.uai.com.br/wp-content/uploads/sites/2/2020/05/flor-e-delfina-e1588561522220-950x534.jpg',
  ];


  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(
        height: displayHeight() / 4,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
      ),
      items: images.map((item) => Container(
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          child: Center(
            child: Image.network(
              item,
              fit: BoxFit.cover,
              width: displayWidth() * 0.99,
              height: displayHeight() /4,
            ),
          ),
        ),
      )).toList()
    );
  }
}
