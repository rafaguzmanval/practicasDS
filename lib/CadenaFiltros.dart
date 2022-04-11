import 'Filtro.dart';
import 'mercado.dart';
import 'FiltroBeneficios.dart';
import 'FiltroGastos.dart';

class CadenaFiltros{

    var filtros = [];

    addFiltro(Filtro f)
    {
      filtros.add(f);
    }

    void ejecutar(Mercado mercado)
    {
      int n = mercado.getNumeroEmpresas();
      // se itera por cada filtro que se va a aplicar.
      for(int i = 0; i < n; i++)
        {
          var valor = mercado.getEmpresa(i).data.last.valor;
          var nuevoValor = 0;
          var nuevoValorTotal = valor;
          for(int j = 0 ; j < filtros.length; j++)
          {
            nuevoValor = filtros[j].ejecutar(valor);
            nuevoValorTotal += nuevoValor;
          }

          mercado.getEmpresa(i).data.last.valor = nuevoValorTotal;

        }
    }

}