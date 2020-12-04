import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_login/dialog.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/globals.dart';
import 'package:intl/intl.dart';

class ExtraDataSignUpPage extends StatefulWidget {
  @override
  _ExtraDataSignUpPageState createState() => _ExtraDataSignUpPageState();
}

class _ExtraDataSignUpPageState extends State<ExtraDataSignUpPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final cpfController = TextEditingController();
  final birthDateController = TextEditingController();

  var cpfMask = new TextInputMask(mask: '999.999.999-99', placeholder: "_", maxPlaceHolders: 11);
  var birthDateMask = new TextInputMask(mask: '99/99/9999', placeholder: "_", maxPlaceHolders: 8);

  bool buttonEnabled = false;

  void saveUserExtraData() async {
    String userDisplayName = (nameController.text.trim() + " " + lastNameController.text.trim()).capitalize;
    String userCPF = cpfController.text.numericOnly();
    DateTime userBirthDate = DateFormat("dd/MM/yyyy").parse(birthDateController.text);

    var user = auth.currentUser;
    if(user != null) {
      user.updateProfile(displayName: userDisplayName);
      FirebaseFirestore.instance.collection('usuarios').doc(user.uid).update({
        "etapa_cadastro": 3,
        "cpf": userCPF,
        "data_aniversario": Timestamp.fromDate(userBirthDate),
      });
      Get.offAndToNamed('/cellphone-registration');
    } else {
      showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
      Get.toNamed('/email-login-signup');
    }
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
                        "DADOS PESSOAIS",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  // Nome
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
                      controller: nameController,
                      textCapitalization: TextCapitalization.words,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value.isEmpty) {
                          return "";
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
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: "Nome",
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
                  // Sobrenome
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
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: lastNameController,
                          textCapitalization: TextCapitalization.words,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if(value.isEmpty) {
                              return "";
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
                              Icons.person,
                              color: Colors.black,
                            ),
                            labelText: "Sobrenome",
                            focusColor: Colors.white,
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
                      ],
                    ),
                  ),
                  // CPF
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
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: cpfController,
                          inputFormatters: [cpfMask],
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if(value.isEmpty) {
                              return "";
                            } if(!value.isCpf) {
                              return "*CPF inválido";
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
                              Icons.contact_mail,
                              color: Colors.black,
                            ),
                            labelText: "CPF",
                            focusColor: Colors.white,
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
                      ],
                    ),
                  ),
                  // Data de Aniversário
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
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: birthDateController,
                          inputFormatters: [birthDateMask],
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if(value.isEmpty) {
                              return "";
                            } else if(value.numericOnly().length < 8) {
                              return "*Data inválida";
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
                              Icons.cake,
                              color: Colors.black,
                            ),
                            labelText: "Data de Aniversário",
                            focusColor: Colors.white,
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
                      ],
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
                          saveUserExtraData();
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
                            'PRÓXIMO',
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
