import 'package:chat_de_flutter/src/custom_views/RFInputText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPhoneView extends StatefulWidget {

  @override
  State<StatefulWidget> createState()
  {

    return _loginPhoneViewState();
  }
}
  class _loginPhoneViewState extends State<LoginPhoneView>
  {

    RFInputText inputTextPhone = RFInputText(
      sTitulo: 'Número de teléfono:',
    );
    RFInputText inputTextCode = RFInputText(
      sTitulo: 'Código de verificación:',
    );
    bool blIsWaitingForSms = false;
    late String verificationId;

    void enviarTelefono(String phoneNumber, BuildContext context) async
    {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential)
        async
        {
          await FirebaseAuth.instance.signInWithCredential(credential);
          print('ME HE LOGEADO!');
          Navigator.of(context).popAndPushNamed('/home');
        },
        verificationFailed: (FirebaseAuthException e)
        {

        },
        codeSent: (String verificationId, int? resendToken)
        {
          this.verificationId = verificationId;
          setState(() {
            blIsWaitingForSms = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId)
        {
          blIsWaitingForSms = true;
        },
      );

    }

    void enviarCodigo(String smsCode, BuildContext context) async
    {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('ME HE LOGEADO!');
      Navigator.of(context).popAndPushNamed('/home');

    }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Phone'),
      ),
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputTextPhone,
            OutlinedButton(
              onPressed: ()
              {
                enviarTelefono(inputTextPhone.getText(), context);
              },
              child: Text('Recibir código'),
            ),
            if(blIsWaitingForSms)
              inputTextCode,
            if(blIsWaitingForSms)
              OutlinedButton(
              onPressed: ()
                {
                  enviarCodigo(inputTextCode.getText(), context);
                },
              child: Text('Verificar'),
            ),
          ],
        ),
      ),
    );

  }
  }

