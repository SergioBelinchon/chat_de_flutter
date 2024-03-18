import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fb_objects/Perfil2.dart';
import '../singleton/DataHolder.dart';

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

  @override
  void initState()
  {
    super.initState();
  }

  void actualizarNombre() async
  {
    //final perfilesRef = db.collection('perfiles').doc();
    //String? idUser = 'Rs4B0yEhP0jtmQ216Jrl';
    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection('perfiles')
        .doc(idUser).withConverter(fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil perfil, _) => perfil.toFirestore());


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
            Text(DataHolder().sMensaje+' '+sNombre),

            if(blIsBottonVisble)OutlinedButton(
              onPressed: ()
              {
                actualizarNombre();
             },
              child: Text('Refresh'),
            ),
            OutlinedButton(
                onPressed:()
              {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).popAndPushNamed('/Login');
                  },
                child: Text('Logout'),
              ),
            ],
         ),
        ),
      );
   }
}