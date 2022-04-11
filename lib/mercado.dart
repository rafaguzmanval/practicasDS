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

  void addJugador(jugador)
  {
    this.jugador = jugador;
  }

  void actualizarMercado()
  {
    for(int i =0; i < empresas.length; i++)
      {
        for(int k = 0 ; k < empresas[i].data.length - 1; k++)
        {
          empresas[i].data[k].valor = empresas[i].data[k + 1].valor;
        }
      }

    gestorF.PeticionFiltros();

    if(empresas.length < 10)
      {
        var rand = Random();

        if(rand.nextInt(10) < 1 && empresasAparecidas.length < nombreEmpresas.length)
          {
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
    else
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
          // Se eliminan las acciones del jugador

          var indice = jugador.acciones.buscarAccionesEmpresa(empresas[min].nombre);
          print(empresas[min].nombre + ' se ha retirado del mercado');
          print('El jugador ha perdido : ' + jugador.acciones.accionesEmpresas[indice].getNumeroAccionesTotal().toString() + ' en ' + empresas[min].nombre);
          jugador.acciones.accionesEmpresas.remove(indice);



          empresas.removeAt(min);


        }


    }


  }

  empresa getEmpresa(int i)
  {
    return empresas[i];
  }

  int getNumeroEmpresas()
  {
    return empresas.length;
  }


}
