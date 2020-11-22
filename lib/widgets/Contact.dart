import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../widgets/BottomNavBarWidget.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  getValues() {
    print(MediaQuery.of(context).viewPadding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            //Fale conosco
            Container(
              child: Text(
                "Fale conosco".toUpperCase(),
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontFamily: 'BalooBhai',
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              width: displayWidth * 0.96,
              margin: EdgeInsets.only(
                left: displayWidth * 0.02,
                right: displayWidth * 0.02,
              ),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.01,
                bottom: displayHeight * 0.01,
              ),
            ),
            //Titulo
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dúvida, bug, sugestão, crítica?".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'BalooBhai',
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              width: displayWidth * 0.96,
              margin: EdgeInsets.only(
                left: displayWidth * 0.02,
                right: displayWidth * 0.02,
                top: displayHeight * 0.02,
              ),
              decoration: BoxDecoration(
                //color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.01,
                //bottom: displayHeight * 0.01,
              ),
            ),
            //Valor
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "ENVIE-NOS UMA MENSAGEM! É MUITO IMPORTANTE PARA NÓS.".toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'BalooBhai',
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              width: displayWidth * 0.96,
              margin: EdgeInsets.only(
                left: displayWidth * 0.02,
                right: displayWidth * 0.02,
                //top: displayHeight * 0.05,
              ),
              decoration: BoxDecoration(
                //color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )
              ),
            ),
            //Mensagem
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  //left: displayWidth * 0.08,
                  top: displayHeight * 0.05,
                  //right: displayWidth * 0.08,
                  bottom: displayHeight * 0.02,
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    cursorColor: Colors.grey,
                    primaryColor: Colors.white,
                  ),
                  child: Material(
                    color: Colors.white,
                    elevation: 7.0,
                    shadowColor: Colors.grey,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                    child: Container(
                      height: displayHeight * 0.20,
                      width: displayWidth * 0.9,
                      child:TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        autofocus: false,
                        style: TextStyle(fontSize: 18.0, color: Colors.grey, fontFamily: 'BalooBhai',),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white
                            ),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          fillColor: Colors.white,
                          hintStyle: new TextStyle(color: Colors.grey, fontSize: 18.0, fontFamily: 'BalooBhai',),
                          hintText: "Mensagem".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Compartilhar
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Enviar mensagem".toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'BalooBhai',
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              width: displayWidth * 0.96,
              margin: EdgeInsets.only(
                left: displayWidth * 0.02,
                right: displayWidth * 0.02,
                top: displayHeight * 0.07,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.003,
                bottom: displayHeight * 0.003,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

