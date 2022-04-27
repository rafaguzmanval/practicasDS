import 'package:test/test.dart';
import 'package:proyecto_bolsa/Jugador.dart';
import 'package:proyecto_bolsa/mercado.dart';

void main () {
  group ('Jugador', () {
    test (' value should start at 20000', () {
      final jugador = new Jugador();
      expect ( jugador.getSaldo() , 20000);
    });
    test (' value should be incremented ', () {
      final jugador = new Jugador();
      jugador.modificarSaldo(1000);
      expect ( jugador.getSaldo() , 21000);
    });
    test (' value should be decreased ', () {
      final jugador = new Jugador();
      jugador.modificarSaldo(-1000);
      expect ( jugador.getSaldo() , 19000);
    });
  });

  group('Mercado', (){
    test ('Numero de empresas inicial es 7', () {
      final mercado = new Mercado();
      expect ( mercado.getNumeroEmpresas() , 7);
    });
    test ('Numero de empresas tiene una probabilidad del 10% de aumentar', () {
      final mercado = new Mercado();
      mercado.introducirEmpresasAutomaticamente();
      expect ( mercado.empresas.length , 8);
    });
    test ('El nombre de la empresa tiene una probabilidad de aparecer al inicio', () {
      final mercado = new Mercado();
      expect ( mercado.getEmpresaPorNombre("Tesla").nombre , "Tesla");
    });
  });

}