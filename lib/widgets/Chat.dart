import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/widgets/Search.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  getValues() {
    print(MediaQuery.of(context).viewPadding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.search,
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Search(),
          ));
        },
      ),
    );
  }
}

