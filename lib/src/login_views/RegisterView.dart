import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RFInputText.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
            RFInputText(
              iLongitudPalabra: 20,
              sHelperText: 'Escriba su contraseña',
              sTitulo: 'Repetir Contraseña:',
              icIzquierda: Icon(Icons.password),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    print('>>>>>>>>>>>>>REGISTRO ACEPTAR');
                  },
                  child: Text('Aceptar'),
                ),
                OutlinedButton(
                  onPressed: () {

                    print('>>>>>>>>>>>>>REGISTRO CANCELAR');
                  },
                  child: Text('Cancelar'),
                )
              ],
            )
          ],
        ),
      ),
    );

  }
}