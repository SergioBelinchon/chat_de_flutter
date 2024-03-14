import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  void actualizarNombre()
  {
    //final perfilesRef = db.collection('perfiles').doc();
    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection('perfiles').doc('Rs4B0yEhP0jtmQ216Jrl');
    docRef.get().then(
        (DocumentSnapshot doc)
            {
              if(doc.exists)
                {
                  final data = doc.data() as Map<String, dynamic>;
                  print('------------------------------->>>>>>>>>>>>>>>>>>> '+data.toString()+ ' '+doc.get('name')+ ' '+data['city']);
                }
              setState(() {
                sNombre = doc.get('name') +' de '+doc.get('city');
                blIsBottonVisble = false;
              });
               //
            },
      onError: (e) => print ('Error getting document: $e'),
    );
    /*setState(() {
      sNombre ='ESPERANDO';
    });

     */

/*
    String? idUser = FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection('perfiles').doc(idUser);

    docRef.get().then(
        (DocumentSnapshot doc)
            {
              if(doc.exists)
                {
                  final data = doc.data() as Map<String, dynamic>;
                  print('------------------>>>>>>>>>>> '+data.toString()+'  '+doc.get('name'));
                }
              setState(() {
                sNombre = 'ESPERANDO';
              });
            },
      onError: (e) => print('------------------------------------->>>>>>><Error getting document: $e'),
    );
    /*
    final docRef = db.collection('perfiles').
        doc(idUser).withConverter(fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil perfil, _) => perfil.toFirestore());

    final docSnap = await docRef.get();
    final perfilUsuario = docSnap.data();

    if(perfilUsuario != null)
    {
      print(perfilUsuario.age);


    }
    else
    {
      print('No such document.');
    }*/
*/
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