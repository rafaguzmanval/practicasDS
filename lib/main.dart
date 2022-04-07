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
    new ValorEmpresa(0, 1500000),
    new ValorEmpresa(1, 1735000),
    new ValorEmpresa(2, 1678000),
    new ValorEmpresa(3, 1890000),
    new ValorEmpresa(4, 1907000),
    new ValorEmpresa(5, 2300000),
    new ValorEmpresa(6, 2360000),
    new ValorEmpresa(7, 1980000),
    new ValorEmpresa(8, 2654000),
    new ValorEmpresa(9, 2789070),
    new ValorEmpresa(10, 3020000),
    new ValorEmpresa(11, 3245900),
    new ValorEmpresa(12, 4098500),
    new ValorEmpresa(13, 4500000),
    new ValorEmpresa(14, 4456500),
    new ValorEmpresa(15, 3900500),
    new ValorEmpresa(16, 5123400),
    new ValorEmpresa(17, 5589000),
    new ValorEmpresa(18, 5940000),
    new ValorEmpresa(19, 6367000),
    new ValorEmpresa(20, 7367000),
    new ValorEmpresa(21, 3245900),
    new ValorEmpresa(22, 4098500),
    new ValorEmpresa(23, 4500000),
    new ValorEmpresa(24, 4456500),
    new ValorEmpresa(25, 3900500),
    new ValorEmpresa(26, 5123400),
    new ValorEmpresa(27, 5589000),
    new ValorEmpresa(28, 5940000),
    new ValorEmpresa(29, 6367000),
    new ValorEmpresa(30, 7367000),
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
        ),)
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
}
