import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFInputText extends StatelessWidget
{
  final String sValorInicial;

  const RFInputText({Key? key, required this.sValorInicial}) : super (key:key);

  @override
  Widget build(BuildContext context)
  {

    return TextFormField(
      cursorColor: Colors.lightBlueAccent,
      initialValue: 'Input Text',
      maxLength: 20,
      decoration: InputDecoration(
        icon: Icon(Icons.favorite),
        labelText: 'Label text',
        labelStyle: TextStyle(
          color: Colors.lightBlueAccent,
        ),
        helperText: 'Helper Text',
        suffixIcon: Icon(
          Icons.check_circle,
        ),
        enabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent)
        ),
      ),
    );
  }

}