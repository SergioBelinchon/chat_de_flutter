import 'package:chat_de_flutter/src/login_views/RegisterView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_views/NameBox.dart';
import 'RFInputText.dart';

class LoginView extends StatelessWidget
{
  const LoginView({Key? key}) : super(key: key);

  void loginPress(String emailAddress, String password) async
  {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      print('ME HE LOGUEADO!');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context)
  {

    String sUsername = 'sergio@sergio.com';
    String sPassword = '123456789';

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RFInputText(
              sValorInicial: sUsername,
              iLongitudPalabra: 20,
              sHelperText: 'Escriba su usuario',
              sTitulo: 'Usuario:',
              icIzquierda: Icon(Icons.account_circle_outlined),
            ),
            RFInputText(
              sValorInicial: sPassword,
              iLongitudPalabra: 20,
              sHelperText: 'Escriba su contraseña',
              sTitulo: 'Contraseña:',
              icIzquierda: Icon(Icons.password),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () async{
                     // Navigator.of(context).popAndPushNamed('/homevacio');
                      print('>>>>>>>>>>>>>LOGIN $sUsername $sPassword');
                      loginPress(sUsername, sPassword);
                    },
                    child: Text('Login'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/registerview');


                    print('>>>>>>>>>>>>>REGISTRO');
                  },
                  child: Text('Registro'),
                )
              ],
            )
          ],
        ),
      ),
    );

  }
}