

import 'PaqueteAccionesCompradas.dart';

class AccionesEmpresa
{

  var idEmpresa;
  var paqueteAcciones = [];

  AccionesEmpresa(id,Paquete)
  {
    this.idEmpresa = id;
    this.paqueteAcciones.add(Paquete);
  }

  // se calcula el numero total de acciones que se han comprado
  int getNumeroAccionesTotal()
  {
    int acciones = 0;
    for(int i = 0; i < paqueteAcciones.length;i++)
      {
        acciones += paqueteAcciones[i].NumeroAccionesCompradas as int;
      }
    return acciones;
  }

  // se calcula el dinero total que se ha invertido en una empresa.
  int getTotalDineroInvertido()
  {
    int dinero = 0;
    for(int i = 0; i < paqueteAcciones.length;i++)
    {
      dinero += (paqueteAcciones[i].NumeroAccionesCompradas as int) * (paqueteAcciones[i].DineroGastado as int);
    }
    return dinero;
  }

  // se eliminan las acciones que se han pedido de la empresa
  void eliminarAcciones(int nAcciones, String nombre)
  {
      int accionesVendidas = nAcciones;

      for(int i = 0; i < paqueteAcciones.length && accionesVendidas > 0 ;i++)
        {
          // si un paquete tiene una cantidad menor o igual a las acciones que se eliminan, entonces se elimina el objeto paquete.
          if(accionesVendidas >= (paqueteAcciones[i].NumeroAccionesCompradas as int))
            {
              accionesVendidas -= paqueteAcciones[i].NumeroAccionesCompradas as int;
              paqueteAcciones.removeAt(i);
            }
          else
            {
              // si se venden menos de las que hay en el paquete entonces se restan
              paqueteAcciones[i].NumeroAccionesCompradas -= accionesVendidas;
              break;
            }
        }
  }

}