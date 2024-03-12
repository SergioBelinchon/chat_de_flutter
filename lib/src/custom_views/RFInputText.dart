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
  final bool  blIsPasswordInput;


   RFInputText({Key? key,
    this.sValorInicial = '',
    this.iLongitudPalabra = 20,
    this.sHelperText = '',
    this.sTitulo = '',
    this.icDerecha = const Icon(Icons.check_circle),
    this.icIzquierda = const Icon(Icons.favorite),
    this.blIsPasswordInput = false}) : super (key:key);

  TextEditingController _controller = TextEditingController();

  String getText()
  {
    return _controller.text;
  }

  @override
  Widget build(BuildContext context)
  {

    return TextFormField(
      controller: _controller,
      cursorColor: Colors.lightBlueAccent,
      maxLength: iLongitudPalabra,
      obscureText: blIsPasswordInput,
      autocorrect: !blIsPasswordInput,
      enableSuggestions: !blIsPasswordInput,
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