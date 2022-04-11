


class Acciones
{

  var accionesEmpresas = [];


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