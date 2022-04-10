import 'empresa.dart';

class mercado{
  var empresas = [];

  mercado()
  {
    var empresa1 = new empresa('Apple');
    var empresa2 = new empresa('Microsoft');

    empresas.add(empresa1);
    empresas.add(empresa2);
  }


}