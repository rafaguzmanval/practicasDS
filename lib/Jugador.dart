import 'Acciones.dart';

class Jugador{

  int _saldo = 0;
  Acciones acciones = new Acciones();

  Jugador()
  {
    _saldo = 20000;
  }

  void modificarSaldo(int valor)
  {
    _saldo += valor;
  }

  int getSaldo()
  {
    return _saldo;
  }


}