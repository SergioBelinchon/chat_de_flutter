import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget
{

  @override
  State<StatefulWidget> createState()
  {
    return _homeViewState();
  }
}

class _homeViewState extends State<HomeView>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Phone'),
      ),
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text('HOME VIEW'),
          ],
        ),
      ),
    );
  }
  
}