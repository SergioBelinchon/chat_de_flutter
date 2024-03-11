import 'package:chat_de_flutter/src/login_views/RegisterView.dart';
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
            RFInputText(
              iLongitudPalabra: 20,
              sHelperText: 'Escriba su usuario',
              sTitulo: 'Usuario:',
              icIzquierda: Icon(Icons.account_circle_outlined),
            ),
            RFInputText(
              iLongitudPalabra: 20,
              sHelperText: 'Escriba su contraseña',
              sTitulo: 'Contraseña:',
              icIzquierda: Icon(Icons.password),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                    print('>>>>>>>>>>>>>LOGIN');
                    },
                    child: Text('Login'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/registerview');

                    //print('>>>>>>>>>>>>>REGISTRO');
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