import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_views/NameBox.dart';
import 'RFInputText.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RFInputText( sValorInicial: 'Inserte s usuario'),
          ],
        ),
      ),
    );

  }
}