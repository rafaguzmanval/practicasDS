import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:proyecto_bolsa/AccionesEmpresa.dart';
import 'package:proyecto_bolsa/Jugador.dart';
import 'package:proyecto_bolsa/PaqueteAccionesCompradas.dart';
import 'package:proyecto_bolsa/empresa.dart';
import 'package:proyecto_bolsa/mercado.dart';
import 'valorEmpresa.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int cont=0;

  var jugador = new Jugador();

  var mercado = new Mercado();

  var nombre = 'Empresa defecto';

  final controller = TextEditingController();
  final List<String> todos=[];
  @override
  Widget build(BuildContext context) {

    mercado.addJugador(jugador);
    nombre = mercado.empresas[cont].nombre;



    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        key: GlobalKey<ScaffoldState>(),
        appBar: AppBar(
          title: const Text('Bolsa'),
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.align_vertical_bottom_outlined),
            ),
            Tab(
              icon: Icon(Icons.feed_outlined),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ]),
        ),
        backgroundColor: Colors.white,

        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 650,
                        height: 150,
                        child:
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 100),
                              height: 50,
                              width: 100,
                              child: MaterialButton(child: Text('<-', style: TextStyle(color: Colors.white)),onPressed: (){
                                setState(() {
                                  this.nombre = this.mercado.getEmpresa(cont).nombre;
                                  this.cont = (this.cont - 1) % this.mercado.empresas.length as int;

                                });
                              }, color: Colors.blue),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 100),
                              height: 50,
                              width: 100,
                              child:Text(
                                this.nombre,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 100),
                              height: 50,
                              width: 100,
                              child: MaterialButton(child: Text('->', style: TextStyle(color: Colors.white)),onPressed: (){
                                setState(() {
                                  this.nombre = this.mercado.getEmpresa(cont).nombre;
                                  this.cont= (this.cont + 1) % mercado.empresas.length as int ;
                                });
                              }, color: Colors.blue),
                            ),
                          ],)
                    ),

                    Container(
                      child: const Text(
                        'Pulsa el botón para generar nuevos valores',
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      alignment: Alignment.centerLeft,

                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 650,
                      height: 450,
                      child: Row(
                        children: [

                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 350,
                            height: 150,
                            child: charts.LineChart(_getSeriesData(), animate: true,),
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 100),
                            height: 50,
                            width: 100,
                            child: MaterialButton(child: Text('Actualizar', style: TextStyle(color: Colors.white)),onPressed: (){
                              _actualizar();
                            }, color: Colors.blue),
                          ),
                        ],),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 650,
                      height: 450,
                      child: Text(('Saldo: \$' + jugador.getSaldo().toString()))
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 650,
                        height: 450,
                      child: MaterialButton(child: Text('Comprar', style: TextStyle(color: Colors.white)),onPressed: (){
                        _comprarAcciones(1);
                      }, color: Colors.green),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 650,
                      height: 450,
                      child: MaterialButton(child: Text('Vender', style: TextStyle(color: Colors.white)),onPressed: (){
                        _venderAcciones(1);
                      }, color: Colors.red),
                    )
                    

                    /*Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 350,
                        height: 280,
                        child:
                        new Column(
                          children: [

                            TextField(
                              controller: controller,
                            ),
                            new Container (
                              margin: const EdgeInsets.only(top: 20,bottom: 10),
                              child: new FloatingActionButton(child: Icon(Icons.add),onPressed: (){
                                setState(() {
                                  todos.insert(0,controller.text);
                                });
                              }),

                            ),

                          ],
                        )
                    ),*/
                  ],
                ),
              ),

            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('${_TextoAccionesPoseidas()}'),
                  ],
                ),
              ),

            ),
            Center(
              child: Text("Aqui va otra cosa o nada"),
            ),
          ],
        ),
      ),
    );
  }

  // este método introduce en la gráfica los valores que tiene una empresa.
  List<charts.Series<ValorEmpresa, int>> _getSeriesData() {
    List<charts.Series<ValorEmpresa, int>> series = [
      charts.Series(
          id: "Sales",
          data: mercado.getEmpresa(cont).data,
          domainFn: (ValorEmpresa series, _) => series.hora,
          measureFn: (ValorEmpresa series, _) => series.valor,
          colorFn: (ValorEmpresa series, _) => charts.MaterialPalette.blue.shadeDefault
      )
    ];
    return series;
  }

  void _actualizar () {
    setState(() {

      mercado.actualizarMercado();

    });
  }
  
  void _comprarAcciones(int numeroAcciones)
  {
    setState(() {
      var precioAccion = mercado.getEmpresa(cont).getPrecioAccion();
      String nombreEmpresaActual = mercado.getEmpresa(cont).nombre;

      //Solo se pueden comprar las acciones si el jugador tiene el dinero suficiente. Podría impedirse en la interfaz que se pudiesen añadir más de las que se pueden
      if(jugador.getSaldo() > (precioAccion * numeroAcciones))
      {
        // se decrementa el saldo del jugador
        jugador.modificarSaldo(-precioAccion * numeroAcciones);

        // se crea un nuevo paquete de acciones que se compran y se comprueba si ya existe un array de acciones de la empresa de la que se quiere comprar
        var paquete = new PaqueteAccionesCompradas(numeroAcciones,precioAccion);
        int indice = jugador.acciones.buscarAccionesEmpresa(nombreEmpresaActual);
        if(indice > -1)// si existe la empresa entonces añadimos al paquete al array ya existente
          {
            jugador.acciones.accionesEmpresas[indice].paqueteAcciones.add(paquete);
          }
        else
          {// si no, creamos un nuevo array con los paquetes de acciones de la empresa seleccionada
            jugador.acciones.accionesEmpresas.add(new AccionesEmpresa(nombreEmpresaActual,paquete));
          }

        // Se envía al historial la nueva transacción
        todos.add(numeroAcciones.toString() + ' acciones compradas de ' + mercado.getEmpresa(cont).nombre + ' al precio de ' + (precioAccion * numeroAcciones).toString() + '\$ , '
            + precioAccion.toString() + '\$ por accion');
        print(todos.last);
      }
    });



  }
  
  void _venderAcciones(int numeroAcciones)
  {
    setState(() {
      var precioAccion = mercado.getEmpresa(cont).getPrecioAccion();
      String nombreEmpresaActual = mercado.getEmpresa(cont).nombre;

      //Se buscan en las acciones del jugador si existen algunas que hayan sido compradas y que sean de la empresa que está seleccionada en el momento
      int indice = jugador.acciones.buscarAccionesEmpresa(nombreEmpresaActual);
      if (indice > -1) {

        //Si el numero de acciones que se quieren vender es mayor que el que se ha comprado, no hay transacción. En la interfaz se debería impedir que se introdujesen
        // mas de las que se tienen. Y tampoco se pueden vender 0 acciones naturalmente.
        var accionesJugador = jugador.acciones.accionesEmpresas[indice].getNumeroAccionesTotal();
        if (accionesJugador >= numeroAcciones && numeroAcciones > 0 && accionesJugador > 0)
        {
          jugador.modificarSaldo(precioAccion * numeroAcciones);
          jugador.acciones.accionesEmpresas[indice].eliminarAcciones(numeroAcciones, nombreEmpresaActual);

          // Se envía al historial la nueva transacción
          todos.add(numeroAcciones.toString() + ' acciones vendidas de ' + mercado.getEmpresa(cont).nombre + ' al precio de \$' +
                  (precioAccion * numeroAcciones).toString() + ' , \$' + precioAccion.toString() + 'por accion');
          print(todos.last);

          // si se han vendido todas las acciones, se elimina el array de las accionesEmpresa
          if(jugador.acciones.accionesEmpresas[indice].getNumeroAccionesTotal() < 1)
            {
              jugador.acciones.accionesEmpresas.removeAt(indice);
            }
        }
      }
    });
  }

  // función auxiliar para el historial de transacciones
  String _textoDeAcciones()
  {
    String devolver = '';
    for(int i = 0; i < todos.length; i++)
      {
        devolver += todos[i] + '\n';
      }

    return devolver;
  }

  String _TextoAccionesPoseidas()
  {
    String devolver = '';
    for(int i = 0; i < jugador.acciones.accionesEmpresas.length; i++)
    {
      devolver += (jugador.acciones.accionesEmpresas[i].idEmpresa as String) + ': \n';
          for(int j = 0; j < jugador.acciones.accionesEmpresas[i].paqueteAcciones.length; j++)
            {
              devolver += jugador.acciones.accionesEmpresas[i].paqueteAcciones[j].NumeroAccionesCompradas.toString() + ' acciones por : \$'
                  + jugador.acciones.accionesEmpresas[i].paqueteAcciones[j].DineroGastado.toString() + ' \n';
            }
      devolver += 'TOTAL: ' + jugador.acciones.accionesEmpresas[i].getNumeroAccionesTotal().toString()
          + ' acciones  por : \$' + jugador.acciones.accionesEmpresas[i].getTotalDineroInvertido().toString() + ' \n';
      devolver += '----------------------------------------------------------------------\n';
    }

    return devolver;
  }
}
