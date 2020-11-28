import 'package:flutter/material.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/ui/Layout.dart';

class Suggest extends StatefulWidget {
  @override
  _SuggestState createState() => _SuggestState();
}

class _SuggestState extends State<Suggest> {
  getValues() {
    print(MediaQuery.of(context).viewPadding);
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            //Fale conosco
            Container(
              child: Text(
                "Sugerir estabelecimento".toUpperCase(),
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
            //Titulo
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Não encontrou o que você queria?".toUpperCase(),
                    style: TextStyle(
                      fontSize: 19,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Deixe aqui a sua sugestão para que possamos entrar\nem contato com o estabelecimento".toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'BalooBhai',
                      fontWeight: FontWeight.w300,
                    ),
                    //textAlign: TextAlign.center,
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
                          hintText: "Nome do estabelecimento".toUpperCase(),
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
                          hintText: "Endereço".toUpperCase(),
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
                          hintText: "Telefone do estabelecimento".toUpperCase(),
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
                    "Enviar sugestão".toUpperCase(),
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
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

