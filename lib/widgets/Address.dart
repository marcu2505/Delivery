import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
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
                "adicionar endereço".toUpperCase(),
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontFamily: 'BalooBhai',
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              width: displayWidth,
              decoration: BoxDecoration(
                  color: Colors.red,
              ),
              padding: EdgeInsets.only(
                top: displayHeight * 0.01,
                bottom: displayHeight * 0.01,
              ),
            ),
            //Nome do estabelecimento
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  //left: displayWidth * 0.08,
                  top: displayHeight * 0.03,
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
                      height: displayHeight * 0.07,
                      width: displayWidth * 0.9,
                      child:TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 1,
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
                          hintText: "Endereço".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Endereço
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  //left: displayWidth * 0.08,
                  top: displayHeight * 0.01,
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
                      height: displayHeight * 0.07,
                      width: displayWidth * 0.9,
                      child:TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 1,
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
                          hintText: "Complemento".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Ponto de referência
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  //left: displayWidth * 0.08,
                  top: displayHeight * 0.01,
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
                      height: displayHeight * 0.07,
                      width: displayWidth * 0.9,
                      child:TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 1,
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
                          hintText: "ponto de referência".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Telefone
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  //left: displayWidth * 0.08,
                  top: displayHeight * 0.01,
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
                      height: displayHeight * 0.07,
                      width: displayWidth * 0.9,
                      child:TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 1,
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
                          hintText: "Apelido".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Enviar
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Enviar endereço".toUpperCase(),
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
    );
  }
}

