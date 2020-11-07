import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'globals.dart';
import 'screens/HomePage.dart';
import 'screens/SignInScreen.dart';
import 'screens/SignUpScreen.dart';
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
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    final pageController = PageController(initialPage: 1);
    SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]
    );
    return FutureBuilder(
      //Inicializa o FlutterFire
      future: _initialization,
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
                  body: SignInScreen(pageController),
                ),
              ],
            ),
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
