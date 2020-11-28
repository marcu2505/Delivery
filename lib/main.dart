import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/screens/HomePage.dart';
import 'package:flutter_login/screens/MainPage.dart';
import 'package:flutter_login/screens/PasswordRecoveryPage.dart';
import 'package:flutter_login/screens/SignUpPage.dart';
import 'package:flutter_login/screens/SplashPage.dart';
import 'package:flutter_login/screens/FilterPage.dart';
import 'package:flutter_login/screens/OrdersPage.dart';
import 'package:flutter_login/screens/ProfilePage.dart';
import 'package:get/get.dart';
import 'globals.dart';
import 'screens/LoginPage.dart';
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
                  page: () => SplashPage()
              ),
              GetPage(
                  name: '/main',
                  page: () => MainPage()
              ),
              GetPage(
                  name: '/login',
                  page: () => LoginPage()
              ),
              GetPage(
                  name: '/signup',
                  page: () => SignUpPage()
              ),
              GetPage(
                  name: '/forgot-password',
                  page: () => PasswordRecoveryPage()
              )
            ],
            // home: PageView(
            //   controller: pageController,
            //   children: <Widget>[
            //     Scaffold(
            //       body: SplashPage(),
            //     ),
            //   ],
            // ),
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
