import 'Filtro.dart';
import 'dart:math';

class FiltroGastos implements Filtro{

  int ejecutar(int valor)
  {
    var ran = Random();
    var suerte = (valor ~/ 10 + ran.nextInt(valor~/15));
    return -suerte;
  }

}