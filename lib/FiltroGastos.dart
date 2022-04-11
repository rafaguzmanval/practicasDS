import 'Filtro.dart';
import 'dart:math';

class FiltroGastos implements Filtro{

  // la empresa siempre gasta un octavo de su valor y a eso se le suma un posible gasto de hasta un quinceavo de su valor
  int ejecutar(int valor)
  {
    var ran = Random();
    var suerte = (valor ~/ 8 + ran.nextInt(valor~/15));
    return -suerte;
  }

}