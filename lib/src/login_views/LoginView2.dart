import 'package:chat_de_flutter/src/App.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom_views/RFInputText.dart';
import '../singleton/DataHolder.dart';

class LoginView2 extends StatelessWidget
{
  LoginView2({Key? key}) : super(key: key);

  RFInputText input1 = RFInputText(sTitulo: 'Usuario',);
  RFInputText input2 = RFInputText(sTitulo: 'Contraseña', blIsPasswordInput: true,);

  void btn1Press(BuildContext context) async
  {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: input1.getText(),
          password: input2.getText(),
      );
      Navigator.of(context).popAndPushNamed('/OnBoarding');

    } on FirebaseAuthException catch (e) {
      print('------------->>>>>>ERROR DE CREACION DE USUARIO '+ e.code);
      if (e.code == 'weak-password') {
        print('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exits for that email.');
      }
    }
    catch(e)
    {
      print(e);
    }
    print('USUARIO CREADO CORRECTAMENTE');
    DataHolder().pruebaFuncion();

  }

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
            input1,
            input2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: ()
                  {
                    btn1Press(context);
                  },
                  child: Text('Login'),
                ),
                OutlinedButton(
                  onPressed: ()
                  {
                    Navigator.of(context).popAndPushNamed('/Registro');

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