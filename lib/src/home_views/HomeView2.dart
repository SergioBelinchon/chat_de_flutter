import 'package:chat_de_flutter/src/fb_objects/Perfil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
   // final perfilUsuario = docSnap.data();
    DataHolder().perfil = docSnap.data()!;
    if(DataHolder().perfil != null)
      {
        print(DataHolder().perfil.age);
        setState(() {
          sNombre = DataHolder().perfil.name!;
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
        title: Text('Rooms'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
        ),
      );
   }
}