import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slider_button/slider_button.dart';
import '../classAll/home_top_info.dart';
import '../classAll/food_category.dart';


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

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
  }

  @override


  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  final textStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,);

  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          //teste
        ],
      ),
    );
//    return Scaffold(
//      backgroundColor: Colors.amber[50],
//
//        body: SafeArea(
//          minimum: const EdgeInsets.all(30),
//          child: Container(
//            child: SingleChildScrollView(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: <Widget>[
//                  SizedBox(
//                    height: displayHeight() / 7,
//                  ),
//                  CarouselSlider(
//                    options: CarouselOptions(
//                      height: displayHeight() / 4,
//                      autoPlay: true,
//                      autoPlayInterval: Duration(seconds: 5),
//                    ),
//                    items: images.map((item) => Container(
//                      margin: EdgeInsets.all(10),
//                      child: ClipRRect(
//                        borderRadius: BorderRadius.all(
//                          Radius.circular(10),
//                        ),
//                        child: Center(
//                          child: Image.network(
//                            item,
//                            fit: BoxFit.cover,
//                            width: displayWidth() * 0.99,
//                            height: displayHeight() /4,
//                          ),
//                        ),
//                      ),
//                    )).toList()
//                  ),
//                  Center(
//                    child: SliderButton(
//                      action: (){
//                        Navigator.of(context).pop();
//                      },
//                      label: Text(
//                        "Slide to cancel Event",
//                        style: TextStyle(
//                          color: Color(0xff4a4a4a), fontWeight: FontWeight.w400, fontSize: 17,
//                        ),
//                      ),
//                      icon: Text(
//                        "x",
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontWeight: FontWeight.w400,
//                          fontSize: 44,
//                        ),
//                      )
//                    ),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Container(
//
//                      ),
//
//                    ],
//                  ),
//                ],
//              ),
//            ),
//        ),
//      ),
//    );
  }
}

