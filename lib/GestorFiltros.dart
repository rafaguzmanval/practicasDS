import 'CadenaFiltros.dart';
import 'FiltroBeneficios.dart';
import 'FiltroGastos.dart';
import 'mercado.dart';

class GestorFiltros{

  var cadena;
  var mercado;


  GestorFiltros(Mercado m)
  {
    cadena = new CadenaFiltros();
    cadena.addFiltro(new FiltroBeneficios());
    cadena.addFiltro(new FiltroGastos());
    mercado = m;
  }

  void PeticionFiltros()
  {
    cadena.ejecutar(mercado);
  }


}