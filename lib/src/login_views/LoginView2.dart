import 'package:chat_de_flutter/src/login_views/RegisterView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_views/NameBox.dart';
import '../custom_views/RFInputText.dart';

class LoginView2 extends StatelessWidget
{
  const LoginView2({Key? key}) : super(key: key);

  void loginPress(String emailAddress, String password, BuildContext context) async
  {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      print('ME HE LOGUEADO!');
      Navigator.of(context).popAndPushNamed('/home');

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

    RFInputText inputUser = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: 'Escriba su usuario',
      sTitulo: 'Usuario:',
      icIzquierda: Icon(Icons.account_circle_outlined),
    );

    RFInputText inputPassword = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: 'Escriba su contraseña',
      sTitulo: 'Contraseña:',
      icIzquierda: Icon(Icons.password),
      blIsPasswordInput: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputUser,
            inputPassword,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: ()
                  {
                    print('>>>>>>>>>>>>>LOGIN ' + inputUser.getText() + ' ' + inputPassword.getText());
                    loginPress(inputUser.getText(), inputPassword.getText(), context);
                  },
                  child: Text('Login'),
                ),
                OutlinedButton(
                  onPressed: ()
                  {
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