import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_bolsa/Acciones.dart';
import 'package:proyecto_bolsa/AccionesEmpresa.dart';
import 'package:proyecto_bolsa/Jugador.dart';
import 'package:proyecto_bolsa/PaqueteAccionesCompradas.dart';
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


  group('Acciones',(){
    test ('Compramos 4 acciones a un precio y otras 4 acciones a otro precio de una misma empresa', () {
      final acciones = new Acciones();
      var paquete1 = new PaqueteAccionesCompradas(4, 100);
      var paquete2 = new PaqueteAccionesCompradas(4, 200);
      var accionesempresas = new AccionesEmpresa('Empresa1', paquete1);
      accionesempresas.paqueteAcciones.add(paquete2);
      acciones.accionesEmpresas.add(accionesempresas);

      expect(acciones.accionesEmpresas.last.getNumeroAccionesTotal(), 8);
      expect(acciones.accionesEmpresas.last.getTotalDineroInvertido(),1200);

    }
    );

    test ('Compramos distintos paquetes de acciones y se venden una cantidad ', () {
      final acciones = new Acciones();
      var paquete1 = new PaqueteAccionesCompradas(4, 100);
      var paquete2 = new PaqueteAccionesCompradas(4, 200);
      var accionesempresas = new AccionesEmpresa('Empresa1', paquete1);
      accionesempresas.paqueteAcciones.add(paquete2);
      acciones.accionesEmpresas.add(accionesempresas);
      acciones.accionesEmpresas.last.eliminarAcciones(7,'Empresa1');

      expect(acciones.accionesEmpresas.last.getNumeroAccionesTotal(), 1);
      expect(acciones.accionesEmpresas.last.getTotalDineroInvertido(), 100);

    }
    );

  });

}