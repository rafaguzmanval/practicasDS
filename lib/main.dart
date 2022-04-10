import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
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
  var nombre = 'Empresa Defecto';
  var merca = new mercado();


  @override
  /*Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
          child: new charts.LineChart(_getSeriesData(), animate: true,),
        )

      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        _actualizar();
      })
    );

  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      appBar: AppBar(
        title: const Text('Dynamic'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 650,
                  height: 150,
                  child:
                    new Row(
                    children: [
                      new Container(
                        margin: const EdgeInsets.only(left: 100),
                        height: 50,
                        width: 100,
                        child: new MaterialButton(child: Text('<-', style: TextStyle(color: Colors.white)),onPressed: (){
                          _actualizar();
                        }, color: Colors.blue),
                      ),

                      new Container(
                        margin: const EdgeInsets.only(left: 100),
                        height: 50,
                        width: 100,
                        child:Text(
                          this.nombre,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 100),
                        height: 50,
                        width: 100,
                        child: new MaterialButton(child: Text('->', style: TextStyle(color: Colors.white)),onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp2()));
                          setState(() {
                            this.nombre = this.merca.empresas[cont].nombre;
                            this.cont= (this.cont + 1) % merca.empresas.length;
                          });
                        }, color: Colors.blue),
                      ),
        ],          )


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
                child: new Row(
                  children: [

                new Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 350,
                    height: 150,
                    child: new charts.LineChart(_getSeriesData(), animate: true,),
                    ),

                    new Container(
                      margin: const EdgeInsets.only(left: 100),
                      height: 50,
                      width: 100,
                      child: new MaterialButton(child: Text('Actualizar', style: TextStyle(color: Colors.white)),onPressed: (){
                        _actualizar();
                      }, color: Colors.blue),
                    ),


                  ],),),

              /*Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 50,
                child: new FloatingActionButton(child: Icon(Icons.add),onPressed: (){
                        _actualizar();
                      }),
              ),*/
            ],
          ),
        ),
      ),


    );
  }

  List<charts.Series<ValorEmpresa, int>> _getSeriesData() {
    List<charts.Series<ValorEmpresa, int>> series = [
      charts.Series(
          id: "Sales",
          data: merca.empresas[cont].data,
          domainFn: (ValorEmpresa series, _) => series.hora,
          measureFn: (ValorEmpresa series, _) => series.valor,
          colorFn: (ValorEmpresa series, _) => charts.MaterialPalette.blue.shadeDefault
      )
    ];
    return series;
  }

  void _actualizar () {
     setState(() {
      /* var rng = Random();

       for(int i = 1; i<30; i++){
         data[i].valor = data[i+1].valor;
       }

       data[30].valor = rng.nextInt(10000000);*/
     });
  }
}
