import 'dart:math';

import 'empresa.dart';

class mercado{
  var empresas = [];

  mercado()
  {
    var empresa1 = new empresa('Apple');
    var empresa2 = new empresa('Microsoft');
    var empresa3 = new empresa('Tesla');
    var empresa4 = new empresa('Amazon');

    empresas.add(empresa1);
    empresas.add(empresa2);
    empresas.add(empresa3);
    empresas.add(empresa4);
  }

  void actualizarMercado()
  {
    var rng = Random();

    for(int i = 0; i < empresas.length; i++)
    {
      for(int j = 1; j<30; j++){
        empresas[i].data[j].valor = empresas[i].data[j+1].valor;
      }
    }

    for(int i = 0; i < empresas.length; i++)
    {
      empresas[i].data[30].valor = rng.nextInt(10000000);
    }
  }

  empresa getEmpresa(int i)
  {
    return empresas[i];
  }


}
