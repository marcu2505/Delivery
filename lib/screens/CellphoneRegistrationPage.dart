import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_login/dialog.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/globals.dart';

class CellphoneRegistrationPage extends StatefulWidget {
  @override
  _CellphoneRegistrationPageState createState() => _CellphoneRegistrationPageState();
}

class _CellphoneRegistrationPageState extends State<CellphoneRegistrationPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  final formKey = GlobalKey<FormState>();
  final cellphoneController = TextEditingController();

  var cellphoneMask = new TextInputMask(mask: ['(99) 9999-9999', '(99) 99999-9999']);
  
  bool buttonEnabled = false;

  void cellphoneRegister() async {
    var userPhone = "+55" + cellphoneController.text.numericOnly();
    var user = auth.currentUser;
    if(user != null) {
      FirebaseFirestore.instance.collection('usuarios').doc(user.uid).update({
        "telefone": userPhone,
      });
      Get.offAndToNamed('/cellphone-verification');
      return;
    } else {
      showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
      Get.toNamed('/email-login-signup');
    }

    Get.offAndToNamed('/cellphone-registration');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: Container(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: displayHeight,
            child: Form(
              key: formKey,
              onChanged: () => setState(() => buttonEnabled = formKey.currentState.validate()),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.top,
                  ),
                  // Botão de Retorno
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 40,
                        ),
                      )
                    ),
                  ),
                  // Título
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: displayWidth / 15,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "NÚMERO DE CELULAR",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  // Número Celular
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: displayWidth / 15,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 7),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: cellphoneController,
                      inputFormatters: [cellphoneMask],
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if(value.isEmpty) {
                          return "";
                        } else if(!value.numericOnly().isPhoneNumber || value.numericOnly().length < 10) {
                          return "*Número de celular inválido";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
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
                        filled: true,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        labelText: "Celular",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Spacer(),
                  // Botão Próximo
                  Container(
                    margin: EdgeInsets.only(
                      left: displayWidth / 10,
                      right: displayWidth / 10,
                      bottom: 12,
                    ),
                    height: 40,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.red,
                      onPressed: buttonEnabled ? () {
                        if(formKey.currentState.validate()) {
                          cellphoneRegister();
                        }
                      } : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            "VALIDAR NÚMERO",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: "BalooBhai",
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight / 20,
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
