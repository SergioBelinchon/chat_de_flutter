import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RFInputText.dart';

class RegisterView extends StatelessWidget
{

  RegisterView({Key? key}) : super(key: key);

  var txt = TextEditingController();


  void registerPressed(String emailAddress, String password, BuildContext context) async
  {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.of(context).popAndPushNamed('/loginview');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        txt.text = 'USUARIO YA EXISTENTE, PRUEBE A RECUPERAR CONTRASEÑA';
      }
    } catch (e) {
      print(e);
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

   RFInputText inputPasswordRep = RFInputText(
    iLongitudPalabra: 20,
    sHelperText: 'Escriba su contraseña',
    sTitulo: 'Repetir Contraseña:',
    icIzquierda: Icon(Icons.password),
     blIsPasswordInput: true,
    );

   TextField txtMensajes = TextField(controller: txt, readOnly: true, style: TextStyle(color: Colors.red, fontSize: 18));

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
            inputPasswordRep,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: ()
                  {
                    if(inputPassword.getText() == inputPasswordRep.getText())
                      {
                        registerPressed(inputUser.getText(), inputPassword.getText(), context);
                      }
                    else
                      {
                        txt.text = 'ERROR, CONTRASEÑAS NO COINCIDEN';
                      }
                    //Navigator.of(context).popAndPushNamed('homeview');
                    //print('>>>>>>>>>>>>>REGISTRO ACEPTAR');
                  },
                  child: Text('Aceptar'),
                ),
                OutlinedButton(
                  onPressed: ()
                  {
                    Navigator.of(context).popAndPushNamed('/loginview');

                   print('>>>>>>>>>>>>>REGISTRO CANCELAR');
                  },
                  child: Text('Cancelar'),
                )
              ],
            ),
            txtMensajes,
          ],
        ),
      ),
    );

  }
}