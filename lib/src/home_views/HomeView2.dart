import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView2 extends StatefulWidget
{

  @override
  State<StatefulWidget> createState()
  {
    return _homeView2State();
  }
}

class _homeView2State extends State<HomeView2>
{
  String sNombre = '--';

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
            Text('HOME VIEW BIENVENIDO' +sNombre),
          ],
        ),
      ),
    );
  }

}