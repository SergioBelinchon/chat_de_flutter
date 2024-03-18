class DataHolder
{
  static final DataHolder _dataHolder = new DataHolder._internal();


  String sMensaje = ' ';


  DataHolder._internal()
  {
    sMensaje = 'Loren Ipsun';
  }

  factory DataHolder()
  {
    return _dataHolder;
  }
}

