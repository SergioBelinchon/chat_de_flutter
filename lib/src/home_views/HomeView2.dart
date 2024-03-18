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

    final List<String> entries = <String>['A', 'B', 'C', 'D', 'F'];
    final List<int> colorCodes = <int>[600, 500, 100, 200, 800];

    return Scaffold(
      appBar: AppBar(
        title: Text('Rooms'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index)
            {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
        ),
      );
   }
}