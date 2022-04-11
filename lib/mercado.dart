import 'dart:math';

import 'package:proyecto_bolsa/GestorFiltros.dart';

import 'empresa.dart';

class Mercado{
  var empresas = [];
  var gestorF;

  Mercado()
  {
    gestorF = GestorFiltros(this);
    var empresa1 = empresa('Apple');
    var empresa2 = empresa('Microsoft');
    var empresa3 = empresa('Tesla');
    var empresa4 = empresa('Amazon');

    empresas.add(empresa1);
    empresas.add(empresa2);
    empresas.add(empresa3);
    empresas.add(empresa4);
  }


  void actualizarMercado()
  {
    for(int i =0; i < empresas.length; i++)
      {
        for(int k = 0 ; k < empresas[i].data.length - 1; k++)
        {
          empresas[i].data[k].valor = empresas[i].data[k + 1].valor;
        }
      }



    gestorF.PeticionFiltros();
  }

  empresa getEmpresa(int i)
  {
    return empresas[i];
  }

  int getNumeroEmpresas()
  {
    return empresas.length;
  }


}
