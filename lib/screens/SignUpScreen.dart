import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'InitScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var phone = new MaskedTextController(
    mask: '(00) 00000-0000',

  );

  var cpf = new MaskedTextController(
    mask: '000.000.000-00',
  );

  var birthDate = new MaskedTextController(
    mask: '00/00/0000',
  );

  final name = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final passwordRepeat = TextEditingController();
  final initDate = DateTime.now();

  bool _obscure = true;

  void _togglePassword(){
    setState(() {
      _obscure = !_obscure;
    });
  }

  void cadastro() async{
    // print("Name: " + name.text);
    // print("Phone: " + phone.text);
    // print("CPF: " + cpf.text);
    // print("BirthDate: " + birthDate.text);
    // print("E-mail: " + emailAddress.text);
    // print("Password: " + password.text);
    // print("PasswordRepeat: " + passwordRepeat.text);
    // print("InitDate: " + initDate.toIso8601String());

    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailAddress.text,
          password: password.text
      );
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => HomePage()
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('A senha é muito fraca, utilize 6 ou mais dígitos.');
      } else if (e.code == 'email-already-in-use') {
        print('Já existe uma conta com este email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: displayHeight() / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  height: displayHeight() / 15,
                  width: displayWidth() / 7,
                  margin: EdgeInsets.symmetric(
                    horizontal: displayWidth() / 35,
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
                  height: displayHeight() / 15,
                  width: displayWidth() / 7,
                  margin: EdgeInsets.symmetric(
                    horizontal: displayWidth() / 35,
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/Instagram-circle-icon-1.png'),
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
                  width: displayWidth() / 3,
                  color: Colors.white,
                  margin: EdgeInsets.only(
                    top: displayWidth() / 30,
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
                    top: displayWidth() / 30,
                  ),
                ),
                Container(
                  height: 1,
                  width: displayWidth() / 3,
                  color: Colors.white,
                  margin: EdgeInsets.only(
                    top: displayWidth() / 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: displayHeight() / 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: displayWidth() / 10
              ),
              height: displayHeight() / 13,
              child: TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
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
            Container(
              margin: EdgeInsets.only(
                top: displayHeight() / 50,
                left: displayWidth() / 10,
                right: displayWidth() / 10,
              ),
              height: displayHeight() / 13,
              child: TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
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
                    Icons.phone,
                    color: Colors.black,
                  ),
                  labelText: "Telefone",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: displayHeight() / 50,
                left: displayWidth() / 10,
                right: displayWidth() / 10,
              ),
              height: displayHeight() / 13,
              child: TextFormField(
                controller: cpf,
                keyboardType: TextInputType.number,
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
            Container(
              margin: EdgeInsets.only(
                top: displayHeight() / 50,
                left: displayWidth() / 10,
                right: displayWidth() / 10,
              ),
              height: displayHeight() / 13,
              child: TextFormField(
                controller: birthDate,
                keyboardType: TextInputType.datetime,
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
            Container(
              margin: EdgeInsets.only(
                top: displayHeight() / 50,
                left: displayWidth() / 10,
                right: displayWidth() / 10,
              ),
              height: displayHeight() / 13,
              child: TextFormField(
                controller: emailAddress,
                keyboardType: TextInputType.emailAddress,
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
            Container(
              margin: EdgeInsets.only(
                top: displayHeight() / 50,
                left: displayWidth() / 10,
                right: displayWidth() / 10,
              ),
              height: displayHeight() / 13,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    controller: password,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    obscureText: _obscure,
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
            Container(
              margin: EdgeInsets.only(
                top: displayHeight() / 50,
                left: displayWidth() / 10,
                right: displayWidth() / 10,
              ),
              height: displayHeight() / 13,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    controller: passwordRepeat,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    obscureText: _obscure,
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
              height: displayHeight() / 20,
            ),
            Container(
              margin: EdgeInsets.only(
                left: displayWidth() / 10,
                right: displayWidth() / 10,
                bottom: displayWidth() / 12,
              ),
              height: displayHeight() / 18,
              child: RaisedButton(
                onPressed: (){
                  cadastro();
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
      ),),
    );
  }
}
