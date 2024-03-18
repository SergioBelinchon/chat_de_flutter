import 'package:chat_de_flutter/src/singleton/DataHolder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_views/RFInputText.dart';
import '../fb_objects/Perfil.dart';

class OnBoardingView extends StatefulWidget {

  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()
  {
    return _OnBoardingViewState();
  }

}
  class _OnBoardingViewState extends State<OnBoardingView>{


  var txt = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState()
  {
    super.initState();
    DataHolder().sMensaje = 'HOLA DESDE ONBOARDING';
    checkExistingProfile;
  }

  void checkExistingProfile() async
  {

    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    // String? idUser = 'Rs4B0yEhP0jtmQ216Jrl';
    final docRef = db.collection('perfiles').doc(idUser);

    DocumentSnapshot docSnap = await docRef.get();

    if(docSnap.exists)
      {
        Navigator.of(context).popAndPushNamed('/Home');
      }
    DataHolder().pruebaFuncion();
  }

  void acceptPressed(String name, String city, String country, int age, BuildContext context) async
  {
  Perfil perfil = Perfil(name: name, city: city, country: country, age: age);

  await db.collection('perfiles').doc(FirebaseAuth.instance.currentUser?.uid).set(perfil.toFirestore())
      .onError((e, _) => print('Error writing document: $e'));

  Navigator.of(context).popAndPushNamed('/Home');
  }

  @override
  Widget build(BuildContext context)
  {
  RFInputText inputName = RFInputText(
  iLongitudPalabra: 20,
  sHelperText: 'Escriba su nombre',
  sTitulo: 'Nombre:',
  icIzquierda: Icon(Icons.account_circle_outlined),
  );

  RFInputText inputCity = RFInputText(
  iLongitudPalabra: 20,
  sHelperText: 'Escriba su ciudad',
  sTitulo: 'Ciudad:',
  icIzquierda: Icon(Icons.password),
  );

  RFInputText inputCountry = RFInputText(
  iLongitudPalabra: 20,
  sHelperText: 'Escriba su país',
  sTitulo: 'País:',
  icIzquierda: Icon(Icons.password),
  );

  RFInputText inputAge = RFInputText(
  iLongitudPalabra: 20,
  sHelperText: 'Escriba su edad',
  sTitulo: 'Edad:',
  icIzquierda: Icon(Icons.password),
  );

  TextField txtMensajes = TextField(controller: txt, readOnly: true, style: TextStyle(color: Colors.red, fontSize: 18));

  return Scaffold(
    appBar: AppBar(
    title: Text('On Boarding'),
      ),
    backgroundColor: Colors.lightGreenAccent,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          inputName,
          inputCity,
          inputCountry,
          inputAge,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
            onPressed: ()
            {
              acceptPressed(inputName.getText(), inputCity.getText(),inputCountry.getText(), int.parse(inputAge.getText()), context);
            },
              child: Text('Aceptar'),
            ),
            OutlinedButton(
            onPressed: ()
              {
              Navigator.of(context).popAndPushNamed('/Login');
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
