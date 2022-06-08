
import 'dart:math';

import 'package:proyecto_bolsa/valorEmpresa.dart';

class Empresa{

  var nombre;
  List<ValorEmpresa> data = [];

  var numeroAcciones;

  
  var suerte = Random();
  

  Empresa(n,valor, acciones)
  {
    this.nombre = n;
    this.data = [
      new ValorEmpresa(0, 0),
      new ValorEmpresa(1, 0),
      new ValorEmpresa(2, 0),
      new ValorEmpresa(3, 0),
      new ValorEmpresa(4, 0),
      new ValorEmpresa(5, 0),
      new ValorEmpresa(6, 0),
      new ValorEmpresa(7, 0),
      new ValorEmpresa(8, 0),
      new ValorEmpresa(9, 0),
      new ValorEmpresa(10, 0),
      new ValorEmpresa(11, 0),
      new ValorEmpresa(12, 0),
      new ValorEmpresa(13, 0),
      new ValorEmpresa(14, 0),
      new ValorEmpresa(15, 0),
      new ValorEmpresa(16, 0),
      new ValorEmpresa(17, 0),
      new ValorEmpresa(18, 0),
      new ValorEmpresa(19, 0),
      new ValorEmpresa(20, 0),
      new ValorEmpresa(21, 0),
      new ValorEmpresa(22, 0),
      new ValorEmpresa(23, 0),
      new ValorEmpresa(24, 0),
      new ValorEmpresa(25, 0),
      new ValorEmpresa(26, 0),
      new ValorEmpresa(27, 0),
      new ValorEmpresa(28, 0),
      new ValorEmpresa(29, 0),
      new ValorEmpresa(30, valor),
    ];

    numeroAcciones = acciones;

  }


  int getPrecioAccion()
  {
    int precio = 0;
    if(numeroAcciones>0)
      precio = data.last.valor ~/ numeroAcciones;
    return precio;
  }

  int getNumeroAcciones(){
    return numeroAcciones;
  }

}