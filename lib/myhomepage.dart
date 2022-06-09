import 'package:flutter/material.dart';
import 'dart:async';
import 'package:proyecto_bolsa/AccionesEmpresa.dart';
import 'package:proyecto_bolsa/Jugador.dart';
import 'package:proyecto_bolsa/PaqueteAccionesCompradas.dart';
import 'package:proyecto_bolsa/API.dart';
import 'package:proyecto_bolsa/mercado.dart';
import 'package:proyecto_bolsa/Grafica.dart';
import 'dart:ui';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.usuario}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String usuario;

  @override
  State<MyHomePage> createState() => _MyHomePageState(usuario);
}

class _MyHomePageState extends State<MyHomePage> {
  String historico=' ';

  int cont=0;



  var mercado = new Mercado();

  var nombre = 'Empresa defecto';

  final controller = TextEditingController();
  final controllerVenta = TextEditingController();


  final List<String> todos=[' '];
  final List<int> numAcciones=[];
  int AccionesAvender=0;

  String usuario="";

  var jugador ;

  _MyHomePageState(String u){
    usuario = u;
    jugador = new Jugador(usuario);
    jugador.setSaldo(usuario);
    this._iniciarMercado();
    this._iniciarAcciones(usuario);
  }

  @override
  void initState(){
    super.initState();
    this._actualizar();
  }

  @override
  Widget build(BuildContext context){
    mercado.addJugador(jugador);
    nombre = mercado.empresas[cont].nombre;

    double porcentaje_pantalla = window.physicalSize.width/MediaQuery.of(context).devicePixelRatio;

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
              icon: Icon(Icons.account_balance_wallet),
            ),
            Tab(
              icon: Icon(Icons.feed_outlined),
              key: ObjectKey("Pesta3"),
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
                        width: porcentaje_pantalla,
                        height: 150,
                        child:
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: (porcentaje_pantalla*0.15)),
                              height: 50,
                              width: porcentaje_pantalla * 0.1,
                              child: MaterialButton(child: Text('<',
                                  style: TextStyle(color: Colors.white, fontSize: 25*MediaQuery.of(context).size.width/porcentaje_pantalla)),
                                  onPressed: () {
                                    setState(() {
                                      this.nombre = this.mercado
                                          .getEmpresa(cont)
                                          .nombre;
                                      this.cont = (this.cont - 1) %
                                          this.mercado.empresas.length as int;
                                    });
                                  },
                                  color: Colors.blue),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: porcentaje_pantalla*0.05),
                              height: 50,
                              width: porcentaje_pantalla * 0.4,
                              child: Text(
                                this.nombre,
                                key: ObjectKey("nombreEmp"),
                                style: TextStyle(fontSize: 30*MediaQuery.of(context).size.width/porcentaje_pantalla), textAlign: TextAlign.center,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: porcentaje_pantalla*0.05),
                              height: 50,
                              width: porcentaje_pantalla * 0.1,
                              child: MaterialButton(child: Text('>',
                                  style: TextStyle(color: Colors.white,fontSize: 25*MediaQuery.of(context).size.width/porcentaje_pantalla)),
                                  onPressed: () {
                                    setState(() {
                                      this.nombre = this.mercado
                                          .getEmpresa(cont)
                                          .nombre;
                                      this.cont = (this.cont + 1) %
                                          mercado.empresas.length as int;
                                    });
                                  },
                                  color: Colors.blue),
                            ),
                          ],)
                    ),

                    Container(
                      margin: EdgeInsets.only(left: porcentaje_pantalla*0.07),
                      width: porcentaje_pantalla*0.8,
                      height: 250,
                      child: Column(
                        children: [

                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: porcentaje_pantalla*0.8,
                            height: 170,
                            child: Grafica(mercado.getEmpresa(cont)),
                          ),
                          Row(
                              children: [
                                Container(
                                  width: porcentaje_pantalla*0.225,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue)),
                                  child: Text(
                                    'Valor empresa: \$' + this.mercado
                                        .getEmpresa(cont)
                                        .data
                                        .last
                                        .valor
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14*MediaQuery.of(context).size.width/porcentaje_pantalla,),),
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: porcentaje_pantalla*0.05),
                                  width:  porcentaje_pantalla*0.225,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue)),
                                  child: Text('Valor accion: \$' +
                                      mercado.getEmpresa(cont)
                                          .getPrecioAccion()
                                          .toString(),
                                    key: ObjectKey("ValorAccion"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15*MediaQuery.of(context).size.width/porcentaje_pantalla),),
                                )
                              ]
                          ),
                        ],),
                    ),

                    Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 350,
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 3)),
                        child: Text(('Usuario: '+usuario+
                            '\nSaldo: \$' + jugador.getSaldo()
                            .toString()) + '\nNº acciones en ' + nombre +
                            ': ' + _stringNAccionesEmpresa(nombre),
                          textScaleFactor: 1.5, textAlign: TextAlign.center,)
                    ),


                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: porcentaje_pantalla,
                        height: 80,
                        child: Row(
                          children: [
                            Container(
                              width: porcentaje_pantalla*0.2,
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, right: porcentaje_pantalla*0.05, left: porcentaje_pantalla*0.3),
                              child: TextField(
                                key: ObjectKey("CampoComprar"),
                                controller: controller,
                                textAlign: TextAlign.center,
                              ),
                            ),

                            MaterialButton(
                                minWidth: porcentaje_pantalla*0.15,
                                key: ObjectKey("botonCompra"),
                                child: Text('Comprar',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  setState(() {
                                    numAcciones.insert(
                                        0, int.parse(controller.text));
                                    _comprarAcciones(
                                        numAcciones.elementAt(0)
                                    );
                                  });
                                },
                                color: Colors.green),

                            MaterialButton(
                                minWidth: porcentaje_pantalla*0.1,
                                child: Text('Max',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  setState(() {
                                    controller.text = _maxAccionesComprar().toString();
                                  });
                                },
                                color: Colors.yellow),
                          ],

                        )
                    ),


                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: porcentaje_pantalla,
                        height: 150,
                        child: Row(
                          children: [
                            Container(
                              width: porcentaje_pantalla*0.2,
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, right: porcentaje_pantalla*0.05, left: porcentaje_pantalla*0.3),
                              child: TextField(
                                controller: controllerVenta,
                                textAlign: TextAlign.center,
                              ),
                            ),

                            MaterialButton(
                                minWidth: porcentaje_pantalla*0.15,
                                child: Text('Vender',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  setState(() {
                                    AccionesAvender =
                                        int.parse(controllerVenta.text);
                                    _venderAcciones(AccionesAvender);
                                  });
                                },
                                color: Colors.red),

                            MaterialButton(
                                minWidth: porcentaje_pantalla*0.1,
                                child: Text('Max',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  setState(() {
                                    controllerVenta.text = _stringNAccionesEmpresa(nombre);
                                  });
                                },
                                color: Colors.yellow),
                          ],
                        )
                    ),
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
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(historico,
                        key: const ObjectKey("TextHistorico")
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }

  Widget _Alerta(String tituloTexto,String textoAlerta) {
    return AlertDialog(
      title: Text(tituloTexto),
      content:
      Text(textoAlerta),
      actions: <Widget>[
        MaterialButton(
            child: Text("Aceptar"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }

  /*Creación de una alerta que avisa de que no se puede comprar
  el número de acciones indicadas*/

  Future<void> _showAlertaCompra(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (_) => _Alerta('Error',"No puedes comprar tantas acciones"),
    );
  }

  /*Creación de una alerta que avisa de que no se pueden vender
  el número de acciones indicadas*/

  Future<void> _showAlertaVenta(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (_) => _Alerta('Error',"No tienes suficientes acciones para vender"),
    );
  }


  void _actualizar () async{
    var reloj = int.parse(await Reloj.getReloj());
    await Future.delayed(Duration(seconds:reloj));
    setState(() {

      _actualizarMercado();

      //Si alguna empresa quiebra cambiamos la gráfica que hay en pantalla
      if(cont>=mercado.empresas.length) cont = mercado.empresas.length-1;

    });
    _actualizar();
  }

  String ActualizarHistory(String actualizacion){
    historico = historico + actualizacion + '\n';

    return historico;

  }

  int _maxAccionesComprar()
  {
    var max= jugador.getSaldo() ~/ mercado.getEmpresa(cont).getPrecioAccion();

    if(max > mercado.getEmpresa(cont).numeroAcciones){
      max = mercado.getEmpresa(cont).numeroAcciones;
    }

    return max;
  }


  void _comprarAcciones(int numeroAcciones)
  {
      var precioAccion = mercado.getEmpresa(cont).getPrecioAccion();
      String nombreEmpresaActual = mercado.getEmpresa(cont).nombre;

      //Solo se pueden comprar las acciones si el jugador tiene el dinero suficiente. Podría impedirse en la interfaz que se pudiesen añadir más de las que se pueden
      if(jugador.getSaldo() > (precioAccion * numeroAcciones) &&  mercado.getEmpresa(cont).getNumeroAcciones()>0)
      {
        // se decrementa el saldo del jugador
        jugador.modificarSaldo(-precioAccion * numeroAcciones);
        AccionesAPI.comprar(numeroAcciones,nombreEmpresaActual,usuario);

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
        todos.add(numeroAcciones.toString() + ' acciones compradas de ' + mercado.getEmpresa(cont).nombre + ' al precio de \$' + (precioAccion * numeroAcciones).toString() + ' , \$'
            + precioAccion.toString() + ' por accion');
        print(todos.last);

        ActualizarHistory(todos.last);
      }
      else{
        _showAlertaCompra(context);
      }

  }

  void _venderAcciones(int numeroAcciones) {
    var precioAccion = mercado.getEmpresa(cont).getPrecioAccion();
    String nombreEmpresaActual = mercado
        .getEmpresa(cont)
        .nombre;

    //Se buscan en las acciones del jugador si existen algunas que hayan sido compradas y que sean de la empresa que está seleccionada en el momento
    int indice = jugador.acciones.buscarAccionesEmpresa(nombreEmpresaActual);
    if (indice > -1) {
      //Si el numero de acciones que se quieren vender es mayor que el que se ha comprado, no hay transacción. En la interfaz se debería impedir que se introdujesen
      // mas de las que se tienen. Y tampoco se pueden vender 0 acciones naturalmente.
      var accionesJugador = jugador.acciones.accionesEmpresas[indice]
          .getNumeroAccionesTotal();

      if (accionesJugador >= numeroAcciones && numeroAcciones > 0 &&
          accionesJugador > 0) {
        jugador.modificarSaldo(precioAccion * numeroAcciones);
        AccionesAPI.vender(-numeroAcciones, nombreEmpresaActual, usuario);
        jugador.acciones.accionesEmpresas[indice].eliminarAcciones(
            numeroAcciones, nombreEmpresaActual);

        // Se envía al historial la nueva transacción
        todos.add(numeroAcciones.toString() + ' acciones vendidas de ' + mercado
            .getEmpresa(cont)
            .nombre + ' al precio de \$' +
            (precioAccion * numeroAcciones).toString() + ' , \$' +
            precioAccion.toString() + ' por accion');
        print(todos.last);

        ActualizarHistory(todos.last);
        // si se han vendido todas las acciones, se elimina el array de las accionesEmpresa
        if (jugador.acciones.accionesEmpresas[indice].getNumeroAccionesTotal() <
            1) {
          jugador.acciones.accionesEmpresas.removeAt(indice);
        }
      } else {
        _showAlertaVenta(context);
      }
    }
    else {
      _showAlertaVenta(context);
    }
  }

  String _TextoAccionesPoseidas()
  {
    String devolver = '';


    for(int i = 0; i < jugador.acciones.accionesEmpresas.length; i++)
    {
      var precioAccion = mercado.getEmpresaPorNombre(jugador.acciones.accionesEmpresas[i].idEmpresa.toString()).getPrecioAccion();
      var accionesDelJugador = jugador.acciones.accionesEmpresas[i].getNumeroAccionesTotal();
      var dineroTotalInvertido = jugador.acciones.accionesEmpresas[i].getTotalDineroInvertido();

      devolver += (jugador.acciones.accionesEmpresas[i].idEmpresa as String) + ': \n';

      devolver += 'Precio por acción: \$' + precioAccion.toString() + '\n';
      devolver += 'TOTAL: ' + accionesDelJugador.toString()
          + ' acciones  por : \$' +
          (precioAccion*accionesDelJugador).toString() + ' \n';
      devolver += '\n Dinero invertido: \$' + dineroTotalInvertido.toString();
      devolver += '\n Balance: \$' + ((precioAccion*accionesDelJugador) - dineroTotalInvertido).toString();
      devolver += '\n----------------------------------------------------------------------\n';
    }

    return devolver;
  }

  String _stringNAccionesEmpresa(nombre){
    int indice = jugador.acciones.buscarAccionesEmpresa(nombre);
    String acciones = '0';
    if(indice>-1) acciones = jugador.acciones.accionesEmpresas[indice].getNumeroAccionesTotal().toString();

    return acciones;
  }

  void _iniciarMercado() async{
    Future<Mercado> m = mercado.iniciarMercado();
    m.then((value) => {
      setState(() {

      })
    });

  }

  void _actualizarMercado() async{
    await mercado.actualizarMercado();
    setState(() {

    });
  }

  void _iniciarAcciones(String nombre) async{
    await jugador.actualizarAcciones(nombre);
    setState(() {

    });
  }
}
