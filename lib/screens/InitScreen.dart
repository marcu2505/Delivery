import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_login/constants.dart';


class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {

  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  PageController pageController;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${post["price"]}",
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  void initState_2() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

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
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
     return SafeArea(
       child: Scaffold(
         backgroundColor: Colors.amber[50],
         appBar: AppBar(
           elevation: 0,
           backgroundColor: Colors.white,
           leading: Icon(
             Icons.menu,
             color: Colors.black,
           ),
           actions: <Widget>[
             IconButton(
               icon: Icon(Icons.search, color: Colors.black),
               onPressed: () {},
             ),
             IconButton(
               icon: Icon(Icons.person, color: Colors.black),
               onPressed: () {},
             )
           ],
         ),
         body: Container(
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 SizedBox(
                   height: displayHeight() / 7,
                 ),
                 CarouselSlider(
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
                 ),
           Container(
             height: size.height,
             child: Column(
               children: <Widget>[
                 const SizedBox(
                   height: 10,
                 ),
                 AnimatedOpacity(
                   duration: const Duration(milliseconds: 200),
                   opacity: closeTopContainer?0:1,
                   child: AnimatedContainer(
                       duration: const Duration(milliseconds: 200),
                       width: size.width,
                       alignment: Alignment.topCenter,
                       height: closeTopContainer?0:categoryHeight,
                       child: categoriesScroller),
                 ),
                 Expanded(
                   child: ListView.builder(
                     controller: controller,
                     itemCount: itemsData.length,
                     physics: BouncingScrollPhysics(),
                     itemBuilder: (context, index) {
                       double scale = 1.0;
                       if (topContainer > 0.5) {
                         scale = index + 0.5 - topContainer;
                         if (scale < 0) {
                           scale = 0;
                         } else if (scale > 1) {
                           scale = 1;
                         }
                       }
                       //liv
                       return Opacity(
                         opacity: scale,
                         child: Transform(
                           transform:  Matrix4.identity()..scale(scale,scale),
                           alignment: Alignment.bottomCenter,
                           child: Align(
                               heightFactor: 0.7,
                               alignment: Alignment.topCenter,
                               child: itemsData[index]),
                         ),
                       );
                     }
                   ),
                 ),
               ],
             ),
           ),
         ],),
       ),
     ),),);
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Most\nFavorites",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Newest",
                          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Super\nSaving",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

