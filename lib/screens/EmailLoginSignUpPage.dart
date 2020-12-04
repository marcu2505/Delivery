import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_login/dialog.dart';
import 'package:flutter_login/ui/Layout.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/globals.dart';

class EmailLoginSignUpPage extends StatefulWidget {
  @override
  _EmailLoginSignUpPageState createState() => _EmailLoginSignUpPageState();
}

class _EmailLoginSignUpPageState extends State<EmailLoginSignUpPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  String title = "Insira seu email";
  String buttonText = "Próximo";
  bool askLoginPassword = false;
  bool askSignUpPassword = false;
  bool showPassword = false;
  bool buttonEnabled = false;

  void checkEmail(BuildContext context) async {
    List<String> methods = await auth.fetchSignInMethodsForEmail(emailController.text.trim());
    if(methods.isNullOrBlank) {
      setState(() {
        title = "Cadastro";
        buttonText = "Cadastrar";
        askSignUpPassword = true;
      });
      return;
    }

    setState(() {
      title = "Entrar";
      buttonText = "Entrar";
      askLoginPassword = true;
    });
  }

  void emailLogin() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      var user = userCredential.user;
      if(user != null) {
        var result = await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).get();
        if(result != null && result.data() != null) {
          int signUpStep = result.data()["etapa_cadastro"];
          switch(signUpStep) {
            case 1:
              showMessageDialog(context: context, message: "Detectamos que seu cadastro não foi concluído", detail: "Etapa atual: Verificação de Email");
              Get.offAndToNamed('/email-verification');
              break;

            case 2:
              showMessageDialog(context: context, message: "Detectamos que seu cadastro não foi concluído", detail: "Etapa atual: Dados Pessoais");
              Get.offAndToNamed('/extra-data');
              break;

            case 3:
              showMessageDialog(context: context, message: "Detectamos que seu cadastro não foi concluído", detail: "Etapa atual: Registro e Verificação de Celular");
              Get.offAndToNamed('/cellphone-registration');
              break;

            case 4:
              Get.offAndToNamed('/main');
              break;
          }

          return;
        }

        FirebaseFirestore.instance.collection('usuarios').doc(user.uid).set({
          "id": user.uid,
          "etapa_cadastro": 1,
        });
        Get.offAndToNamed('/email-verification');
      } else {
        showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
        Get.toNamed('/email-login-signup');
      }
    } on FirebaseAuthException catch(e) {
      if(e.code == "wrong-password") {
        showMessageDialog(context: context, message: "Email/senha incorretos", detail: "Por favor, tente novamente!");
      } else if(e.code == "user-not-found") {
        showMessageDialog(context: context, message: "Usuário não cadastrado ou email incorreto", detail: "Por favor, tente novamente!");
      }

      Get.toNamed('/email-login-signup');
    } catch (e) {
      // TODO: checar possibilidade de logar erro
      showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
      Get.toNamed('/email-login-signup');
    }
  }

  bool isPasswordCompliant(String password, [int minLength = 8]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = true;
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    // TODO: checar se existe necessidade do caracter especial
    bool hasSpecialCharacters = true; //password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minLength;

    return hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters & hasMinLength;
  }

  void emailSignUp() async {
    if(!isPasswordCompliant(passwordController.text)) {
      showMessageDialog(context: context, message: "A senha não cumpre os requisitos de segurança");
      passwordController.text = repeatPasswordController.text = "";
      return;
    }

    if(repeatPasswordController.text != passwordController.text) {
      showMessageDialog(context: context, message: "As senhas devem ser iguais");
      passwordController.text = repeatPasswordController.text = "";
      return;
    }

    try {
      await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      if(auth.currentUser != null) {
        FirebaseFirestore.instance.collection('usuarios').doc(auth.currentUser.uid).set({
          "id": auth.currentUser.uid,
          "etapa_cadastro": 1,
        });
        Get.offAndToNamed('/email-verification');
      } else {
        showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
        passwordController.text = repeatPasswordController.text = "";
      }
    } on FirebaseAuthException catch(e) {
      if(e.code == "weak-password") {
        showMessageDialog(context: context, message: "A senha não cumpre os requisitos de segurança");
        passwordController.text = repeatPasswordController.text = "";
      } else if(e.code == "email-already-in-use") {
        showMessageDialog(context: context, message: "Email já utilizado", detail: "Tente entrar com um outro método de login.");
        Get.toNamed('/email-login-signup');
      }
    } catch (e) {
      // TODO: checar possibilidade de logar erro
      showMessageDialog(context: context, message: "Erro desconhecido", detail: "Por favor, tente novamente! Se o problema persistir, entre em contato com o suporte.");
      passwordController.text = repeatPasswordController.text = "";
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
                        title.toUpperCase(),
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if(value.isEmpty) {
                          return "";
                        } else if(!value.isEmail) {
                          return "*Email inválido";
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
                          Icons.email,
                          color: Colors.black,
                        ),
                        labelText: "Email",
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
                  // Senha
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
                    child: (!askLoginPassword && !askSignUpPassword) ? null : Column(
                      children: <Widget>[
                        TextFormField(
                          controller: passwordController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          obscureText: !showPassword,
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
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () => setState(() => showPassword = !showPassword),
                              child: Icon(
                                showPassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                            labelText: "Senha",
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
                  // Esqueceu a senha/Repetir a senha
                  askLoginPassword ? Container(
                    margin: EdgeInsets.only(
                      right: displayWidth / 20,
                      top: 2,
                    ),
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => {
                        Get.toNamed('/forgot-password')
                      },
                      child: Text(
                        "Esqueci minha senha",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    // Repita a senha
                  ) : askSignUpPassword ? Container(
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
                    child: !askSignUpPassword ? null : Column(
                      children: <Widget>[
                        TextFormField(
                          controller: repeatPasswordController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          obscureText: !showPassword,
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
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () => setState(() => showPassword = !showPassword),
                              child: Icon(
                                showPassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                            labelText: "Repita a senha",
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
                  ) : Container(),
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
                          askLoginPassword ? emailLogin() : askSignUpPassword ? emailSignUp() : checkEmail(context);
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
                            buttonText.toUpperCase(),
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
                            child: (askLoginPassword != false || askSignUpPassword != false) ? null : Icon(
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
