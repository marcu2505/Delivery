import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/globals.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  final phone = TextEditingController();
  var phoneMask = new TextInputMask(mask: ['(99) 9999-9999', '(99) 99999-9999']);

  final cpf = TextEditingController();
  var cpfMask = new TextInputMask(mask: '999.999.999-99', placeholder: "_", maxPlaceHolders: 11);

  final birthDate = TextEditingController();
  var birthDateMask = new TextInputMask(mask: '99/99/9999', placeholder: "_", maxPlaceHolders: 8);

  final name = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final passwordRepeat = TextEditingController();

  bool _obscure = true;
  void _togglePassword(){
    setState(() {
      _obscure = !_obscure;
    });
  }

  bool isPasswordCompliant(String password, [int minLength = 8]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    // TODO: checar se existe necessidade do caracter especial
    bool hasSpecialCharacters = true; //password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minLength;

    return hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters & hasMinLength;
  }

  void signUp() async{
    phone.text = "(31) 99571-9635";
    cpf.text = "133.817.646-32";
    birthDate.text = "04/09/2000";
    password.text = "batataMagica20";
    passwordRepeat.text = password.text;

    String userName = name.text;
    print("Name: " + userName);

    String userPhone = "+55" + phone.text.numericOnly();
    print("Phone: " + userPhone);

    String userCPF = cpf.text.numericOnly();
    print("CPF: " + userCPF);

    DateTime userBirthDate = DateFormat("dd/MM/yyyy").parse(birthDate.text);
    print("BirthDate: " + userBirthDate.toString());

    print("E-mail: " + emailAddress.text);
    print("Password: " + password.text);
    print("PasswordRepeat: " + passwordRepeat.text);

    if(!isPasswordCompliant(password.text)) {
      print("A senha não cumpre os requisitos de segurança");
      return;
    }

    if(passwordRepeat.text != password.text) {
      print("As senhas não conferem");
      return;
    }

    // FirebaseAuth auth = FirebaseAuth.instance;
    // try {
    //   UserCredential userCredential = await auth.createUserWithEmailAndPassword(
    //       email: emailAddress.text,
    //       password: password.text
    //   );
    //
    //   await userCredential.user.updateProfile(displayName: name.text);
    //   await userCredential.user.sendEmailVerification();
    //
    //   // auth.
    //   // Get.offAndToNamed('/home');
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('Senha inválida, certifique-se de cumprir os requisitos de segurança.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('Já existe uma conta com este email.');
    //   }
    // } catch (e) {
    //   print(e.toString());
    // };

    // TODO: checar o erro retornado
    // auth.verifyPhoneNumber(
    //     phoneNumber: "+" + phone.text.numericOnly(),
    //     timeout: Duration(seconds: 60),
    //     verificationCompleted: (AuthCredential authCredential){
    //       print("VERIFICADO!");
    //     },
    //     verificationFailed: (FirebaseAuthException authException){
    //       print("FALHA: " + authException.message);
    //     },
    //     codeSent: (String verificationId, [int forceResendingToken]){
    //       print("ENVIADO!");
    //       //show dialog to take input from the user
    //     },
    //     codeAutoRetrievalTimeout: (String verificationId){
    //       verificationId = verificationId;
    //       print(verificationId);
    //       print("TIMEOUT!");
    //     },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      content: Container(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: displayHeight / 15,
                ),
                // Cadastro Social
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(
                        horizontal: displayWidth / 35,
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/google.png'),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: 50,
                      width: 50,
                      // margin: EdgeInsets.symmetric(
                      //   horizontal: displayWidth / 35,
                      // ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/iconface.png'),
                            fit: BoxFit.cover,
                          )
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 1,
                      width: displayWidth / 3,
                      color: Colors.white,
                      margin: EdgeInsets.only(
                        top: displayWidth / 30,
                      ),
                    ),
                    Container(
                      child: Text(
                        "OU",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: displayWidth / 30,
                      ),
                    ),
                    Container(
                      height: 1,
                      width: displayWidth / 3,
                      color: Colors.white,
                      margin: EdgeInsets.only(
                        top: displayWidth / 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: displayHeight / 50,
                ),
                // Nome
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: displayWidth / 10
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: name,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if(value.isEmpty) {
                        return "*Campo obrigatório";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      labelText: "Nome completo",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                // Telefone
                // Container(
                //   margin: EdgeInsets.only(
                //     top: displayHeight / 50,
                //     left: displayWidth / 10,
                //     right: displayWidth / 10,
                //   ),
                //   decoration: BoxDecoration(
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.3),
                //         spreadRadius: 1,
                //         blurRadius: 10,
                //         offset: Offset(0, 7), // changes position of shadow
                //       ),
                //     ],
                //   ),
                //   child: TextFormField(
                //     inputFormatters: [phoneMask],
                //     controller: phone,
                //     keyboardType: TextInputType.phone,
                //     validator: (value) {
                //       if(value.isEmpty) {
                //         return "*Campo obrigatório";
                //       } else if(!value.isPhoneNumber) {
                //         return "*Telefone inválido";
                //       }
                //
                //       return null;
                //     },
                //     decoration: InputDecoration(
                //       fillColor: Colors.white,
                //       border: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white),
                //         borderRadius: const BorderRadius.all(
                //           const Radius.circular(50.0),
                //         ),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white),
                //         borderRadius: const BorderRadius.all(
                //           const Radius.circular(50.0),
                //         ),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white),
                //         borderRadius: const BorderRadius.all(
                //           const Radius.circular(50.0),
                //         ),
                //       ),
                //       filled: true,
                //       prefixIcon: Icon(
                //         Icons.phone,
                //         color: Colors.black,
                //       ),
                //       labelText: "Telefone",
                //       labelStyle: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w400,
                //         fontSize: 15,
                //       ),
                //     ),
                //     style: TextStyle(fontSize: 14, color: Colors.black),
                //   ),
                // ),
                // CPF
                Container(
                  margin: EdgeInsets.only(
                    top: displayHeight / 50,
                    left: displayWidth / 10,
                    right: displayWidth / 10,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextFormField(
                    inputFormatters: [cpfMask],
                    controller: cpf,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if(value.isEmpty) {
                        return "*Campo obrigatório";
                      } else if(!value.isCpf) {
                        return "*CPF inválido";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.assignment_ind,
                        color: Colors.black,
                      ),
                      labelText: "CPF",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                // Data de Nascimento
                Container(
                  margin: EdgeInsets.only(
                    top: displayHeight / 50,
                    left: displayWidth / 10,
                    right: displayWidth / 10,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextFormField(
                    inputFormatters: [birthDateMask],
                    controller: birthDate,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if(value.isEmpty) {
                        return "*Campo obrigatório";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      labelText: "Data de nascimento",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                // Email
                Container(
                  margin: EdgeInsets.only(
                    top: displayHeight / 50,
                    left: displayWidth / 10,
                    right: displayWidth / 10,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: emailAddress,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value.isEmpty) {
                        return "*Campo obrigatório";
                      } else if(!value.isEmail) {
                        return "*Endereço de email inválido";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                // Senha
                Container(
                  margin: EdgeInsets.only(
                    top: displayHeight / 50,
                    left: displayWidth / 10,
                    right: displayWidth / 10,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        controller: password,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        obscureText: _obscure,
                        validator: (value) {
                          if(value.isEmpty) {
                            return "*Campo obrigatório";
                          } else if(value.length < 8) {
                            return "*Mínimo 8 caracteres";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: _togglePassword,
                            child: Icon(
                              _obscure ? Icons.visibility : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          labelText: "Senha",
                          focusColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                // Confirmação Senha
                Container(
                  margin: EdgeInsets.only(
                    top: displayHeight / 50,
                    left: displayWidth / 10,
                    right: displayWidth / 10,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        controller: passwordRepeat,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        obscureText: _obscure,
                        validator: (value) {
                          if(value.isEmpty) {
                            return "*Campo obrigatório";
                          } else if(value.length < 8) {
                            return "*Mínimo 8 caracteres";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: _togglePassword,
                            child: Icon(
                              _obscure ? Icons.visibility : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          labelText: "Repita a senha",
                          focusColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: displayHeight / 9,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: displayWidth / 10,
                    right: displayWidth / 10,
                    bottom: displayWidth / 12,
                  ),
                  height: displayHeight / 18,
                  child: RaisedButton(
                    onPressed: (){
                      if(formKey.currentState.validate()) {
                        signUp();
                      }
                    },
                    child: Text('Cadastrar', style: TextStyle(color: Colors.white, fontSize: 20),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
