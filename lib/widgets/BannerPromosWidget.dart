import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_login/globals.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

class BannerPromosWidget extends StatefulWidget {
  @override
  _BannerPromosWidgetState createState() => _BannerPromosWidgetState();
}

int _total = 0;
int _current = 0;
List<bool> active;

class _BannerPromosWidgetState extends State<BannerPromosWidget> {
  List<String> images = [
    'https://1.bp.blogspot.com/-8DqWkexSYjg/UArV5bxmnDI/AAAAAAAAAW0/2AsdbnOcfaY/s1600/promo.jpg',
    'https://shopdognv.com.br/wp-content/uploads/2019/05/promoces.png',
    'https://1.bp.blogspot.com/-IdaT8Kd0TXA/WcGYyCmM34I/AAAAAAAADKM/qtkgR3wI2J4Y2PbztGJZ-Qej0VtHxMIwwCLcBGAs/s1600/21739963_299390873802525_5819270412136651673_n.png',
    'https://vetus.com.br/universidade/wp-content/uploads/2017/11/promo%C3%A7%C3%A3o-02.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerPromosCarousel(),
        // TODO: Implementar marcador de posição embaixo
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: active.map((isActive) {
        //     // int index = snapshot.data.docs.indexOf(promo);
        //     // print(index);
        //     return Container(
        //       width: 8.0,
        //       height: 8.0,
        //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: isActive// _current == index
        //             ? Color.fromRGBO(0, 0, 0, 0.9)
        //             : Color.fromRGBO(0, 0, 0, 0.4),
        //       ),
        //     );
        //   }).toList(),
        // ),
      ],
    );
  }
}

class BannerPromoTile extends StatelessWidget {
  String thumbUrl;
  String url;

  BannerPromoTile(
      {Key key,
        @required this.thumbUrl,
        @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          Uri uri = Uri.parse(this.url);
          launch(uri.toString());
        },
        child: Container(
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
                this.thumbUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
    );
  }
}

class BannerPromosCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: FirebaseFirestore.instance.collection('promocoes').where("type", isEqualTo: "banner").get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("Carregando promoções...");
        _total = snapshot.data.size;
        active = List.filled(_total, false);
        print(active.toString());
        return new CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: displayHeight / 5,
            viewportFraction: 0.88,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              _current = index;
              active = List.filled(active.length, false);
              active[index] = true;
            }
          ),
          items: snapshot.data.docs.map((promo) {
            return new BannerPromoTile(
              thumbUrl: promo["thumb_url"],
              url: promo["url"],
            );
          }).toList(),
        );
      },
    );
  }
}
