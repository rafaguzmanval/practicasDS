import 'CadenaFiltros.dart';
import 'FiltroBeneficios.dart';
import 'FiltroGastos.dart';
import 'mercado.dart';

class GestorFiltros{

  var cadena;
  var mercado;


  GestorFiltros(Mercado m)
  {
    // Se inicializa la cadena y los filtros.
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