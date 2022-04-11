


class Acciones
{

  var accionesEmpresas = [];

// Devuelve el indice donde se encuentra la empresa. Devuelve -1 no existe o no se ha encontrado la empresa en el la cartera del jugador
  int buscarAccionesEmpresa(String nombre)
  {
    int dev = -1;
    for(int i = 0; i < accionesEmpresas.length;i++)
      {
        if(accionesEmpresas[i].idEmpresa as String == nombre)
          {
            dev = i;
            break;
          }
      }

    return dev;
  }



}