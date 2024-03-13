import 'package:cloud_firestore/cloud_firestore.dart';
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

    final docRef = db.collection('perfiles').doc('Rs4B0yEhP0jtmQ216Jrl');

    docRef.get().then(
            (DocumentSnapshot doc)
        {
          if(doc.exists)
            {
              final data = doc.data() as Map<String, dynamic>;
              print('------------------------------>>>>>>>'+data.toString()+ '   '+doc.get('name')+'  '+data['name']);

            }

          setState(()
          {
            sNombre = doc.get('name');
            blIsBottonVisble = false;
          });
       },
        onError: (e) => print('Error getting documents: $e'),
    );

    setState(() {
      sNombre = 'ESPERANDO';
    });
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