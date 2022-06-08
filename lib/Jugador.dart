import 'package:proyecto_bolsa/AccionesEmpresa.dart';
import 'package:proyecto_bolsa/PaqueteAccionesCompradas.dart';

import 'Acciones.dart';
import 'API.dart';
class Jugador{

  int _saldo = 0;
  Acciones acciones = new Acciones();

  Jugador(String name)
  {
    this.setSaldo(name);
  }

  void modificarSaldo(int valor)
  {
    this._saldo+=valor;
  }

    Future<Jugador> setSaldo(String name) async{
      var peticion = await Usuario.getUsuario(name);

      _saldo = peticion.saldo!;
      return this;
    }

    int getSaldo(){
    return _saldo;
    }

    Future<Jugador> actualizarAcciones(String name) async {
      var peticion = await AccionesAPI.getAcciones(name);

      for (var i = 0; i < acciones.accionesEmpresas.length; i++) {
        if (peticion.contains(acciones.accionesEmpresas[i])) {
          acciones.accionesEmpresas.removeAt(i);
        }
      }

      for (var i = 0; i < peticion.length; i++) {
        if (!acciones.accionesEmpresas.contains(peticion[i])) {
          EmpresaAPI empresa = await EmpresaAPI.getEmpresa(
              peticion[i].empresa_id.toString());
            acciones.accionesEmpresas.add(new AccionesEmpresa(
                empresa.nombre,
                new PaqueteAccionesCompradas(peticion[i].numero, 0)));
        }
      }

      return this;
    }
}