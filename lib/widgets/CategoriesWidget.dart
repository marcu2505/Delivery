import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CategoriesTitle(),
          CategoriesList(),
        ],
      ),
    );
  }
}

class CategoriesTitle extends StatelessWidget {
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
              "Categorias".toUpperCase(),
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

class CategoryTile extends StatelessWidget {
  String name;
  String icon;
  String slug;

  CategoryTile(
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

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: FirebaseFirestore.instance.collection('categorias').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) return new Text("Carregando...");
        return new Container(
          height: 120,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: snapshot.data.docs.map((category) {
              return new CategoryTile(
                name: category["nome"],
                slug: category["slug"],
                icon: category["imagem"],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
