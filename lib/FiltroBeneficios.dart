import 'Filtro.dart';
import 'dart:math';

class FiltroBeneficios implements Filtro{

  // La empresa puede aumentar hasta un tercio de su valor
  int ejecutar(int valor)
  {
    var ran = Random();
    var suerte = ran.nextInt(valor ~/ 3);
    return suerte;
  }

}