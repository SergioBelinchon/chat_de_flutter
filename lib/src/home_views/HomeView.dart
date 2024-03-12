import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _homeViewState();
  }
}

  class _homeViewState extends State<HomeView>
  {
/*
  FirebaseFirestore db = FirebaseFirestore.instance;
  String sNombre = 'AQUI IRA EL NOMBRE';

  @override
  Widget initState()
  {
  super.initState();
  getProfile();
  }
*/

  void getProfile() async
  {

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatdar'),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HOME VIEW BIENVENIDO'),
          ],
        ),
      ),
    );
  }
  }


