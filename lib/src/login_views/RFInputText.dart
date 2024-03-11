import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFInputText extends StatelessWidget
{
  final String sValorInicial;
  final int iLongitudPalabra;
  final String sHelperText;
  final String sTitulo;
  final Icon icIzquierda;
  final Icon icDerecha;


  const RFInputText({Key? key,
    this.sValorInicial = '',
    this.iLongitudPalabra = 20,
    this.sHelperText = '',
    this.sTitulo = '',
    this.icDerecha = const Icon(Icons.check_circle),
    this.icIzquierda = const Icon(Icons.favorite)}) : super (key:key);

  @override
  Widget build(BuildContext context)
  {

    return TextFormField(
      cursorColor: Colors.lightBlueAccent,
      initialValue: this.sValorInicial,
      maxLength: iLongitudPalabra,
      decoration: InputDecoration(
        icon: this.icIzquierda,
        labelText: this.sTitulo,
        labelStyle: TextStyle(
          color: Colors.lightBlueAccent,
        ),
        helperText: this.sHelperText,
        suffixIcon: this.icDerecha,
        enabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent)
        ),
      ),
    );
  }

}