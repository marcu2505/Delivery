import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/CellphoneRegistrationPage.dart';
import 'package:flutter_login/screens/CellphoneVerificationPage.dart';
import 'package:flutter_login/screens/EmailLoginSignUpPage.dart';
import 'package:flutter_login/screens/ExtraDataSignUpPage.dart';
import 'package:flutter_login/screens/MainPage.dart';
import 'package:flutter_login/screens/PasswordRecoveryPage.dart';
import 'package:flutter_login/screens/SplashPage.dart';
import 'package:flutter_login/screens/EmailVerificationPage.dart';
import 'package:get/get.dart';
import 'package:flutter_login/globals.dart';
import 'package:flutter_login/screens/LoginPage.dart';
import 'package:flutter/services.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Future<void> InicializacaoFirebase() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  // }

  @override
  Widget build(BuildContext context) {
    environment = DotEnv().env['ENVIRONMENT'];

    // InicializacaoFirebase();
    final Future<FirebaseApp> firebaseInitialize = Firebase.initializeApp();
    final pageController = PageController(initialPage: 1);
    SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]
    );
    return FutureBuilder(
      //Inicializa o FlutterFire
      future: firebaseInitialize,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Delivery Regional',
            theme: ThemeData(
              cursorColor: Colors.black,
              primarySwatch: Colors.blue,
            ),
            home: PageView(
              controller: pageController,
              children: <Widget>[
                Scaffold(
                  body: Text(
                    "\n\nAlgo deu errado",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            defaultTransition: Transition.native,
            locale: Locale('pt', 'BR'),
            theme: ThemeData(
              cursorColor: Colors.black,
              primarySwatch: Colors.blue,
            ),
            getPages: [
              GetPage(
                name: '/',
                page: () => SplashPage(),
              ),
              GetPage(
                name: '/main',
                page: () => MainPage(),
              ),
              GetPage(
                name: '/login',
                page: () => LoginPage(),
              ),
              GetPage(
                title: "Inserção Email - Login/Cadastro_1",
                name: '/email-login-signup',
                page: () => EmailLoginSignUpPage(),
              ),
              GetPage(
                title: "Verificação Email - Cadastro_2",
                name: '/email-verification',
                page: () => EmailVerificationPage(),
              ),
              GetPage(
                title: "Dados Extras - Cadastro_3",
                name: '/extra-data',
                page: () => ExtraDataSignUpPage(),
              ),
              GetPage(
                title: "Cadastro Celular",
                name: '/cellphone-registration',
                page: () => CellphoneRegistrationPage(),
              ),
              GetPage(
                title: "Verificação Celular - Cadastro_4",
                name: '/cellphone-verification',
                page: () => CellphoneVerificationPage(),
              ),
              GetPage(
                name: '/forgot-password',
                page: () => PasswordRecoveryPage(),
              )
            ],
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login',
          theme: ThemeData(
            cursorColor: Colors.black,
            primarySwatch: Colors.blue,
          ),
          home: PageView(
            controller: pageController,
            children: <Widget>[
              Scaffold(
                body: Text(
                  "\n\nCarregando...",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );

  }
}
