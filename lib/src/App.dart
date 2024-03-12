
import 'package:chat_de_flutter/src/login_views/LoginPhoneView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_views/HomeVacio.dart';
import 'login_views/LoginView.dart';
import 'login_views/RegisterView.dart';

class App extends StatelessWidget
{

  const App({Key? key}) : super (key:key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Chatdar',
      initialRoute: '/loginphoneview',
      routes: {
        '/loginview': (context) => const LoginView(),
        '/registerview': (context) => RegisterView(),
        '/loginphoneview' : (context) => LoginPhoneView(),
      },
      home: RegisterView(),
    );
  }
}