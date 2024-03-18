import '../fb_objects/Perfil.dart';

class DataHolder
{
  static final DataHolder _dataHolder = new DataHolder._internal();


  String sMensaje = ' ';
  Perfil perfil = Perfil();


  DataHolder._internal()
  {
    sMensaje = 'Loren Ipsun';
  }

  factory DataHolder()
  {
    return _dataHolder;
  }
}

