import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proyecto_bolsa/API.dart';

import 'empresa.dart';

class Mercado{
  var empresas = [];
  var jugador;

  var nombreEmpresas = ['Apple','Microsoft','Tesla','Amazon','Google','Yahoo','Sony','CDproyect','Nintendo','Samsung','Huawei','Xiaomi','Electronic Arts','Ubisoft'
    ,'Asus','Toyota','BMW','Inditex','Repsol','Telefonica','Vodafone','Orange','Mediaset','Iberdrola','Mapfre','Endesa','CaixaBank','BBVA','Santander','IBM','Facebook',
    'Cocacola','Disney','Mercadona','Seat','Bitcoin','Cepsa','El Pozo','Prosegur','Mercedes','Alphabet','Alibaba','Berkshire','Netflix','Walmart','PepsiCo','SpaceX','Pfizer'
    ,'Moderna','AstraZeneca','Adobe','Paypal','Bank of America','Mastercard','Johnson & Johnson','Nestlé','Nvidia','Intel','AMD','Visa','Warner Bros','Nike','Adidas'];

  var empresasAparecidas = [];

  var nuevoEvento = false;

  var mensajeEvento = '';

  Mercado()
  {

    this.jugador = jugador;

    this.empresas = [new Empresa("", 0, 1)];

  }

    // este método sirve para ligar el jugador al mercado, si se pudiese introducir desde el constructor estaria mejor, pero dart da muchos problemas.
    void addJugador(jugador)
    {
      this.jugador = jugador;
    }


  Empresa getEmpresaPorNombre(String nombre){
    var empresa = null;

    for(int i=0; i<empresas.length && empresa==null; i++){
      if(empresas[i].nombre == nombre)
        empresa = empresas[i];
    }

    return empresa;
  }

    Future<Mercado> iniciarMercado() async{
      var peticion = await EmpresaAPI.getEmpresas();

      empresas=[];

      for(var i=0; i<peticion.length;i++) {
        empresas.add(new Empresa(peticion[i].nombre,peticion[i].valor,peticion[i].acciones));
      }

      return this;
    }

    Future<Mercado> actualizarMercado() async
    {
      var peticion = await EmpresaAPI.getEmpresas();

      for(var i=0; i<empresas.length;i++){
        if(!contiene(peticion,empresas[i].nombre)){
          empresas.removeAt(i);
        }
      }

      desplazarValoresAlaDerecha();

      for(var i=0; i<peticion.length;i++) {
        if(!contiene(empresas,peticion[i].nombre)){
          empresas.add(new Empresa(peticion[i].nombre,peticion[i].valor,peticion[i].acciones));
        }
        else{
          empresas[i].data.last.valor = peticion[i].valor;
          empresas[i].numeroAcciones = peticion[i].acciones;
        }
      }

      return this;
    }

    Empresa getEmpresa(int i)
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

    bool contiene(List<dynamic> lista,String nombre){
      for(var i = 0; i<lista.length;i++){
        if(nombre==lista[i].nombre)
          return true;
      }
      return false;
    }
}
