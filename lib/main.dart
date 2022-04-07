import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(const MyApp());
}

class ValorEmpresa {
  final int valor;
  final int hora;

  ValorEmpresa(this.hora, this.valor);
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
  int _counter = 0;

  final data = [
    new ValorEmpresa(0, 0),
    new ValorEmpresa(1, 0),
    new ValorEmpresa(2, 0),
    new ValorEmpresa(3, 0),
    new ValorEmpresa(4, 0),
    new ValorEmpresa(5, 0),
    new ValorEmpresa(6, 0),
    new ValorEmpresa(7, 0),
    new ValorEmpresa(8, 0),
    new ValorEmpresa(9, 0),
    new ValorEmpresa(10, 0),
    new ValorEmpresa(11, 0),
    new ValorEmpresa(12, 0),
    new ValorEmpresa(13, 0),
    new ValorEmpresa(14, 0),
    new ValorEmpresa(15, 0),
    new ValorEmpresa(16, 0),
    new ValorEmpresa(17, 0),
    new ValorEmpresa(18, 0),
    new ValorEmpresa(19, 0),
    new ValorEmpresa(20, 0),
    new ValorEmpresa(21, 0),
    new ValorEmpresa(22, 0),
    new ValorEmpresa(23, 0),
    new ValorEmpresa(24, 0),
    new ValorEmpresa(25, 0),
    new ValorEmpresa(26, 0),
    new ValorEmpresa(27, 0),
    new ValorEmpresa(28, 0),
    new ValorEmpresa(29, 0),
    new ValorEmpresa(30, 0),
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Expanded(
          child: new charts.LineChart(_getSeriesData(), animate: true,),
        ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        _actualizar();
      }))
    );

  }

  List<charts.Series<ValorEmpresa, int>> _getSeriesData() {
    List<charts.Series<ValorEmpresa, int>> series = [
      charts.Series(
          id: "Sales",
          data: data,
          domainFn: (ValorEmpresa series, _) => series.hora,
          measureFn: (ValorEmpresa series, _) => series.valor,
          colorFn: (ValorEmpresa series, _) => charts.MaterialPalette.blue.shadeDefault
      )
    ];
    return series;
  }

  void _actualizar () {
    var rng = Random();

    for(int i = 0; i<29; i++){
      data(i).valor = data(i+1).valor;
    }

    data(29).valor = rng.nextInt(10000000);
  }
}
