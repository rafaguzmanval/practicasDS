

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

  int getNumeroAccionesTotal()
  {
    int acciones = 0;
    for(int i = 0; i < paqueteAcciones.length;i++)
      {
        acciones += paqueteAcciones[i].NumeroAccionesCompradas as int;
      }
    return acciones;
  }

  void venderAcciones(int nAcciones, String nombre)
  {
      int accionesVendidas = nAcciones;

      for(int i = 0; i < paqueteAcciones.length;i++)
        {
          if(accionesVendidas > (paqueteAcciones[i].NumeroAccionesCompradas as int))
            {
              accionesVendidas -= paqueteAcciones[i].NumeroAccionesCompradas as int;
              paqueteAcciones.removeAt(i);

            }
          else
            {
              paqueteAcciones[i].NumeroAccionesCompradas -= accionesVendidas;
              break;
            }
        }
  }

}