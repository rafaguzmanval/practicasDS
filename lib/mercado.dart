import 'dart:math';

import 'package:proyecto_bolsa/GestorFiltros.dart';

import 'empresa.dart';

class Mercado{
  var empresas = [];
  var gestorF;
  var jugador;

  var nombreEmpresas = ['Apple','Microsoft','Tesla','Amazon','Google','Yahoo','Sony','CDproyect','Nintendo','Samsung','Huawei','Xiaomi','Electronic Arts','Ubisoft'
    ,'Asus','Toyota','BMW','Inditex','Repsol','Telefonica','Vodafone','Orange','Mediaset','Iberdrola','Mapfre','Endesa','CaixaBank','BBVA','Santander','IBM','Facebook',
    'Cocacola','Disney','Mercadona','Seat','Bitcoin','Cepsa','El Pozo','Prosegur','Mercedes','Alphabet','Alibaba','Berkshire','Netflix','Walmart','PepsiCo','SpaceX','Pfizer'
    ,'Moderna','AstraZeneca','Adobe','Paypal','Bank of America','Mastercard','Johnson & Johnson','Nestlé','Nvidia','Intel','AMD','Visa','Warner Bros','Nike','Adidas'];

  var empresasAparecidas = [];

  Mercado()
  {
    gestorF = GestorFiltros(this);

    var rand = Random();

    this.jugador = jugador;

    for(int i = 0 ; i < 7; i++)
      {
        var numero = rand.nextInt(nombreEmpresas.length);
        while(empresasAparecidas.contains(nombreEmpresas[numero]))
          {
            numero = rand.nextInt(nombreEmpresas.length);
          }

        empresasAparecidas.add(nombreEmpresas[numero]);
        var nuevaEmpresa = empresa(nombreEmpresas[numero]);

        empresas.add(nuevaEmpresa);
      }

  }

    // este método sirve para ligar el jugador al mercado, si se pudiese introducir desde el constructor estaria mejor, pero dart da muchos problemas.
    void addJugador(jugador)
    {
      this.jugador = jugador;
    }


  empresa getEmpresaPorNombre(String nombre){
    var empresa = null;

    for(int i=0; i<empresas.length && empresa==null; i++){
      if(empresas[i].nombre == nombre)
        empresa = empresas[i];
    }

    return empresa;
  }

    void actualizarMercado()
    {

      // Cada vez que se actualiza el mercado, los valores retroceden y el valor más antiguo se pierda
      desplazarValoresAlaDerecha();

      // se llama al gestor de filtros para que genere el último valor
      gestorF.PeticionFiltros();

      //El mercado dinámico introduce y elimina empresas del el mercado con las que se puede interaccionar
      mercadoDinamico();
    }

    empresa getEmpresa(int i)
    {
      return empresas[i];
    }



    int getNumeroEmpresas()
    {
      return empresas.length;
    }

    void desplazarValoresAlaDerecha()
    {
      for(int i =0; i < empresas.length; i++)
      {
        for(int k = 0 ; k < empresas[i].data.length - 1; k++)
        {
          empresas[i].data[k].valor = empresas[i].data[k + 1].valor;
        }
      }
    }

    void mercadoDinamico() {
      // si existen menos de 10 empresas tan solo se introducen empresas, en caso contrario se empiezan a eliminar
      if (empresas.length < 10) {
        introducirEmpresasAutomaticamente();
      }
      else
      {
        eliminarEmpresasAutomaticamente();
      }
    }

    void introducirEmpresasAutomaticamente()
    {
      var rand = Random();

      // hay una probabilidad de un 10% de que aparezca una nueva empresa hasta que se hayan acabado los nombres de nuevas empresas.
      if(rand.nextInt(10) < 1 && empresasAparecidas.length < nombreEmpresas.length)
      {
        // se introducira una nombre de empresa aleatorio que no se haya usado previamente
        var numero = rand.nextInt(nombreEmpresas.length);
        while(empresasAparecidas.contains(nombreEmpresas[numero]))
        {
          numero = rand.nextInt(nombreEmpresas.length);
        }

        empresasAparecidas.add(nombreEmpresas[numero]);

        var nuevaEmpresa = empresa(nombreEmpresas[numero]);

        empresas.add(nuevaEmpresa);

        print(nuevaEmpresa.nombre + ' ha entrado en el mercado');
      }

    }

    void eliminarEmpresasAutomaticamente()
    {
      var rand = Random();

      if(rand.nextInt(10) < 3 && empresas.length > 7)
      {
        int min = 0;
        int minimoValor = empresas[0].data.last.valor;
        for(int i = 1; i < empresas.length; i++)
        {
          if(minimoValor > empresas[i].data.last.valor)
          {
            minimoValor =  empresas[i].data.last.valor;
            min = i;
          }
        }

        print(empresas[min].nombre + ' se ha retirado del mercado');

        // Se eliminan las acciones del jugador que se hayan invertido en una empresa que se ha arruinado y por tanto pierde el dinero
        var indice = jugador.acciones.buscarAccionesEmpresa(empresas[min].nombre);

        if(indice > -1)
        {
          print('El jugador ha perdido : ' + jugador.acciones.accionesEmpresas[indice].getNumeroAccionesTotal().toString() + ' acciones en ' + empresas[min].nombre);
          // se elimina el array de las acciones de empresa que se han eliminado
          jugador.acciones.accionesEmpresas.removeAt(indice);
        }

        // finalmente se elimina la empresa que se ha arruinado
        empresas.removeAt(min);
      }
    }


}
