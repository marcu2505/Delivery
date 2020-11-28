
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/ui/Layout.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {

  PageController pageController;



  List<String> images = [
    'https://observatoriodatv.uol.com.br/wp-content/uploads/2020/05/Floribella-de-volta-na-Band-1.gif',
    'https://observatoriodatv.uol.com.br/wp-content/uploads/2020/05/Juliana-Silveira-%C3%A9-a-protagonista-de-Floribella-na-Band.jpg',
    'https://i0.wp.com/portalovertube.com/wp-content/uploads/2020/05/Floribella.png',
    'https://tvefamosos.uai.com.br/wp-content/uploads/sites/2/2020/05/flor-e-delfina-e1588561522220-950x534.jpg',
  ];

  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
  }

  final textStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,);

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: displayHeight / 7,
              ),
              CarouselSlider(
                  options: CarouselOptions(
                    height: displayHeight / 4,
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
                          width: displayWidth * 0.99,
                          height: displayHeight /4,
                        ),
                      ),
                    ),
                  )).toList()
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

