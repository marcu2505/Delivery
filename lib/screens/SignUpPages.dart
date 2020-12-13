import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/dialog.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

// Verificação de Email
class EmailVerificationPage extends StatefulWidget {
  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Timer timer;

  void checkVerifiedEmail() async {
    var user = auth.currentUser;
    if (user != null) {
      user.sendEmailVerification();
      timer = Timer.periodic(Duration(seconds: 5), (timer) async {
        await auth.currentUser.reload();
        user = auth.currentUser;
        if (user.emailVerified) {
          timer.cancel();
          FirebaseFirestore.instance
              .collection('usuarios')
              .doc(user.uid)
              .update({
            "etapa_cadastro": 2,
          });
          Get.offAndToNamed('/extra-data');
        }
      });
    } else {
      showMessageDialog(
          context: context,
          message: "Erro desconhecido",
          detail:
              "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
      Get.toNamed('/email-login-signup');
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    checkVerifiedEmail();
    return Layout.render(
      content: Container(
        child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: displayHeight,
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
                        )),
                  ),
                  // Título
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: displayWidth / 15,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "VERIFIQUE SEU EMAIL",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  // Email
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: displayWidth / 15,
                        vertical: 12,
                      ),
                      child: Text(
                        "Precisamos que você entre em um link que enviamos para o seu email, "
                        "após isso basta voltar ao aplicativo e continuar seu cadastro. "
                        "O email pode demorar até 5 minutos para chegar.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}

// Dados Pessoais
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

  var cpfMask = new TextInputMask(
      mask: '999.999.999-99', placeholder: "_", maxPlaceHolders: 11);
  var birthDateMask = new TextInputMask(
      mask: '99/99/9999', placeholder: "_", maxPlaceHolders: 8);

  bool buttonEnabled = false;

  void saveUserExtraData() async {
    String userDisplayName =
        (nameController.text.trim() + " " + lastNameController.text.trim())
            .capitalize;
    String userCPF = cpfController.text.numericOnly();
    DateTime userBirthDate =
        DateFormat("dd/MM/yyyy").parse(birthDateController.text);

    var user = auth.currentUser;
    if (user != null) {
      user.updateProfile(displayName: userDisplayName);
      FirebaseFirestore.instance.collection('usuarios').doc(user.uid).update({
        "etapa_cadastro": 3,
        "cpf": userCPF,
        "data_aniversario": Timestamp.fromDate(userBirthDate),
      });
      Get.offAndToNamed('/cellphone-registration');
    } else {
      showMessageDialog(
          context: context,
          message: "Erro desconhecido",
          detail:
              "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
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
                onChanged: () => setState(
                    () => buttonEnabled = formKey.currentState.validate()),
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
                          )),
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
                          if (value.isEmpty) {
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
                              if (value.isEmpty) {
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
                              if (value.isEmpty) {
                                return "";
                              }
                              if (!value.isCpf) {
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
                              if (value.isEmpty) {
                                return "";
                              } else if (value.numericOnly().length < 8) {
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
                        onPressed: buttonEnabled
                            ? () {
                                if (formKey.currentState.validate()) {
                                  saveUserExtraData();
                                }
                              }
                            : null,
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
              )),
        ),
      ),
    );
  }
}

// Cadastro de Telefone
class CellphoneRegistrationPage extends StatefulWidget {
  @override
  _CellphoneRegistrationPageState createState() =>
      _CellphoneRegistrationPageState();
}

class _CellphoneRegistrationPageState extends State<CellphoneRegistrationPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final cellphoneController = TextEditingController();

  var cellphoneMask =
      new TextInputMask(mask: ['(99) 9999-9999', '(99) 99999-9999']);

  bool buttonEnabled = false;

  void cellphoneRegister() async {
    var userPhone = "+55" + cellphoneController.text.numericOnly();
    var user = auth.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection('usuarios').doc(user.uid).update({
        "telefone": userPhone,
      });
      Get.offAndToNamed('/cellphone-verification');
      return;
    } else {
      showMessageDialog(
          context: context,
          message: "Erro desconhecido",
          detail:
              "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
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
                onChanged: () => setState(
                    () => buttonEnabled = formKey.currentState.validate()),
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
                          )),
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
                          if (value.isEmpty) {
                            return "";
                          } else if (!value.numericOnly().isPhoneNumber ||
                              value.numericOnly().length < 10) {
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
                        onPressed: buttonEnabled
                            ? () {
                                if (formKey.currentState.validate()) {
                                  cellphoneRegister();
                                }
                              }
                            : null,
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
              )),
        ),
      ),
    );
  }
}

// Validação de Telefone
class CellphoneVerificationPage extends StatefulWidget {
  @override
  _CellphoneVerificationPageState createState() =>
      _CellphoneVerificationPageState();
}

class _CellphoneVerificationPageState extends State<CellphoneVerificationPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  var codeMask = new TextInputMask(mask: '999999');

  bool sent = false;
  String code = "";
  String verificationId = "";
  PhoneAuthCredential phoneCredential;

  void cellphoneVerification() async {
    var user = auth.currentUser;
    this.phoneCredential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: this.code);
    if (this.phoneCredential != null) {
      try {
        user.updatePhoneNumber(this.phoneCredential);
      } catch (e) {
        // TODO: checar possibilidade de logar erro
        showMessageDialog(
            context: context, message: "Insira seu número novamente");
        Get.offAndToNamed('/cellphone-registration');
        return;
      }

      FirebaseFirestore.instance.collection('usuarios').doc(user.uid).update({
        "telefone": null,
        "etapa_cadastro": 4,
      });
      Get.offAllNamed('/main');
      return;
    }

    showMessageDialog(context: context, message: "Código incorreto");
    Get.offAndToNamed('/cellphone-verification');
  }

  void sendVerificationCode() async {
    if (!this.sent) {
      var user = auth.currentUser;
      if (user != null) {
        var result = await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(user.uid)
            .get();
        if (result != null && result.data() != null) {
          String userPhone = result.data()["telefone"];
          auth.verifyPhoneNumber(
            phoneNumber: userPhone,
            timeout: const Duration(seconds: 10),
            verificationCompleted: (PhoneAuthCredential phoneCredential) {
              this.phoneCredential = phoneCredential;
            },
            verificationFailed: (FirebaseAuthException authException) {
              // print('Erro desconhecido: ${authException.message}');
              showMessageDialog(
                  context: context,
                  message: "Erro desconhecido",
                  detail:
                      "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
              setState(() => this.sent = false);
            },
            codeSent: (String verificationId, [int forceResend]) {
              this.verificationId = verificationId;
              showMessageDialog(
                  context: context, message: "Código enviado para $userPhone");
              setState(() => this.sent = true);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              this.verificationId = verificationId;
              showMessageDialog(
                  context: context,
                  message: "Código reenviado para $userPhone");
              setState(() => this.sent = true);
            },
          );
          return;
        }

        FirebaseFirestore.instance.collection('usuarios').doc(user.uid).set({
          "id": user.uid,
          "etapa_cadastro": 1,
        });
      }

      showMessageDialog(
          context: context,
          message: "Erro desconhecido",
          detail:
              "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
      Get.offAndToNamed('/login');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sendVerificationCode();
    return Layout.render(
      content: Container(
        child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: displayHeight,
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
                        )),
                  ),
                  // Título
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: displayWidth / 15,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "VERIFICAR NÚMERO",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'BalooBhai',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  // Código Verificação
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: displayWidth / 15,
                      vertical: 12,
                    ),
                    child: PinInputTextField(
                      pinLength: 6,
                      onChanged: (value) {
                        setState(() => code = value);
                      },
                      keyboardType: TextInputType.number,
                      inputFormatter: [codeMask],
                      decoration: BoxLooseDecoration(
                        strokeColorBuilder:
                            PinListenColorBuilder(Colors.green, Colors.white),
                        strokeWidth: 2,
                        bgColorBuilder:
                            PinListenColorBuilder(Colors.white, Colors.white),
                      ),
                    ),
                  ),
                  Spacer(),
                  // Botão Finalizar
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
                      onPressed:
                          code.length == 6 ? cellphoneVerification : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            "FINALIZAR",
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
            )),
      ),
    );
  }
}
