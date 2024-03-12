
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
      title: 'Flutter Chat',
      initialRoute: '/loginview',
      routes: {
        '/loginview': (context) => const LoginView(),
        '/registerview': (context) => const RegisterView(),
        '/homevacio' : (context) => HomeVacio(),
      },
      home: RegisterView(),
    );
  }
}