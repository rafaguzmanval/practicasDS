import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:proyecto_bolsa/empresa.dart';
import 'package:proyecto_bolsa/valorEmpresa.dart';

class Grafica extends Container{

  var _empresa = null;

  Grafica(Empresa empresa){
    _empresa = empresa;
  }

  @override
  Container build(BuildContext context) {
    super.build(context);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 350,
      height: 150,
      child: charts.LineChart(_getSeriesData(), animate: true,),
    );
  }

  // este método introduce en la gráfica los valores que tiene una empresa.
  List<charts.Series<ValorEmpresa, int>> _getSeriesData() {
    List<charts.Series<ValorEmpresa, int>> series = [
      charts.Series(
          id: "Sales",
          data: _empresa.data,
          domainFn: (ValorEmpresa series, _) => series.hora,
          measureFn: (ValorEmpresa series, _) => series.valor.truncate(),
          colorFn: (ValorEmpresa series, _) => charts.MaterialPalette.blue.shadeDefault
      )
    ];
    return series;
  }
}