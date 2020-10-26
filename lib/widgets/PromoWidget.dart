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
  int _current = 0;

  List<String> images = [
    'https://1.bp.blogspot.com/-8DqWkexSYjg/UArV5bxmnDI/AAAAAAAAAW0/2AsdbnOcfaY/s1600/promo.jpg',
    'https://shopdognv.com.br/wp-content/uploads/2019/05/promoces.png',
    'https://1.bp.blogspot.com/-IdaT8Kd0TXA/WcGYyCmM34I/AAAAAAAADKM/qtkgR3wI2J4Y2PbztGJZ-Qej0VtHxMIwwCLcBGAs/s1600/21739963_299390873802525_5819270412136651673_n.png',
    'https://vetus.com.br/universidade/wp-content/uploads/2017/11/promo%C3%A7%C3%A3o-02.png',
  ];

  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CarouselSlider(
            items: images.map((item) => Container(
              margin: EdgeInsets.only(
                left: 7,
                right: 7,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Center(
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: displayHeight() / 5,
              viewportFraction: 0.88,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((url) {
              int index = images.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]
    );
  }
}
