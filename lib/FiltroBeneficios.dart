import 'Filtro.dart';
import 'dart:math';

class FiltroBeneficios implements Filtro{

  int ejecutar(int valor)
  {
    var ran = Random();
    var suerte = ran.nextInt(valor ~/ 4);
    return suerte;
  }

}