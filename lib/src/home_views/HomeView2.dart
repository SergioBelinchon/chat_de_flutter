import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fb_objects/Perfil2.dart';

class HomeView2 extends StatefulWidget
{

  @override
  State<StatefulWidget> createState()
  {
    return _HomeView2State();
  }
}

class _HomeView2State extends State<HomeView2>
{
  FirebaseFirestore db = FirebaseFirestore.instance;
  String sNombre = '--';
  bool blIsBottonVisble = true;

  void actualizarNombre() async
  {
    //final perfilesRef = db.collection('perfiles').doc();
    String? idUser = 'Rs4B0yEhP0jtmQ216Jrl';
    final docRef = db.collection('perfiles')
        .doc(idUser).withConverter(fromFirestore: Perfil2.fromFirestore,
        toFirestore: (Perfil2 perfil2, _) => perfil2.toFirestore());

    final docSnap = await docRef.get();
    final perfilUsuario = docSnap.data();
    if(perfilUsuario != null)
      {
        print(perfilUsuario.age);
        setState(() {
          sNombre = perfilUsuario.name!;
        });
      }
    else
      {
        print('No such document.');
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatdar'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HOME VIEW BIENVENIDO ' +sNombre),

            if(blIsBottonVisble)OutlinedButton(
              onPressed: ()
              {
                actualizarNombre();
             },
              child: Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }

}