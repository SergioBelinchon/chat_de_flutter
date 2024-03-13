import 'package:chat_de_flutter/src/home_views/HomeView2.dart';
import 'package:chat_de_flutter/src/login_views/LoginView.dart';
import 'package:chat_de_flutter/src/login_views/RegisterView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class App2 extends StatelessWidget {

  const App2({Key? key}) : super (key: key);

  String isUserLogged() {
    if (FirebaseAuth.instance.currentUser == null) {
      return '/Login';
    }
    else {
      Fluttertoast.showToast(
        msg: 'BIENVENIDO A LA APP ' +FirebaseAuth.instance.currentUser!.email!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0,
      );

      return '/Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: isUserLogged(),
        routes: {
          '/Login': (context) => LoginView(),
          '/Registro': (context) => RegisterView(),
          '/Home': (context) => HomeView2(),
        }
    );
  }
}

