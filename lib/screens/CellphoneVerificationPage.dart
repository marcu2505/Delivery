import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/dialog.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/globals.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class CellphoneVerificationPage extends StatefulWidget {
  @override
  _CellphoneVerificationPageState createState() => _CellphoneVerificationPageState();
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
    this.phoneCredential = PhoneAuthProvider.credential(verificationId: this.verificationId, smsCode: this.code);
    if(this.phoneCredential != null) {
      try {
        user.updatePhoneNumber(this.phoneCredential);
      } catch(e) {
        // TODO: checar possibilidade de logar erro
        showMessageDialog(context: context, message: "Insira seu número novamente");
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
    if(!this.sent) {
      var user = auth.currentUser;
      if(user != null) {
        var result = await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).get();
        if(result != null && result.data() != null) {
          String userPhone = result.data()["telefone"];
          auth.verifyPhoneNumber(
            phoneNumber: userPhone,
            timeout: const Duration(seconds: 10),
            verificationCompleted: (PhoneAuthCredential phoneCredential) {
              this.phoneCredential = phoneCredential;
            },
            verificationFailed: (FirebaseAuthException authException) {
              // print('Erro desconhecido: ${authException.message}');
              showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
              setState(() => this.sent = false);
            },
            codeSent: (String verificationId, [int forceResend]) {
              this.verificationId = verificationId;
              showMessageDialog(context: context, message: "Código enviado para $userPhone");
              setState(() => this.sent = true);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              this.verificationId = verificationId;
              showMessageDialog(context: context, message: "Código reenviado para $userPhone");
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

      showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
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
                      strokeColorBuilder: PinListenColorBuilder(Colors.green, Colors.white),
                      strokeWidth: 2,
                      bgColorBuilder: PinListenColorBuilder(Colors.white, Colors.white),
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
                    onPressed: code.length == 6 ? cellphoneVerification : null,
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
          )
        ),
      ),
    );
  }
}
