// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:proyecto_bolsa/main.dart';

void main() {
  testWidgets('Comprar accion', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.runAsync(() async {
      await tester.pumpWidget(const MyApp());

      var nombreEmp = find.byKey(ObjectKey("nombreEmp"));
      var textEmp = nombreEmp.evaluate().single.widget as Text;

      expect ( find.text('Saldo: \$20000\nNº acciones en ' + (textEmp.data as String) + ': 0') , findsOneWidget );
      print('Saldo: \$20000\nNº acciones en ' + (textEmp.data as String) + ': 0');
      print("\n");


      //Introducimos en el campo de texto las acciones que vamos a comprar
      var numAcc = 2;
      await tester.enterText(find.byKey(ObjectKey("CampoComprar")), numAcc.toString());

      /*Buscamos el boton de compra mediante el campo key
      * Bajamos la pantalla hasta que el botón sea visible
      * Pulsamos el botón para comprar el número de acciones indicado
      * */
      var botonC = find.byKey(ObjectKey("botonCompra"));
      await tester.dragUntilVisible(
        botonC,
        find.byType(SingleChildScrollView),
        const Offset(0, 600),
      );
      await tester.tap(botonC);
      await tester.pump();

      /*Buscamos el campo con el valor actual de la acción
      * De ese campo sacamos el un int con el valor de la acción y se lo restamos a 20000
      * para obtener el saldo restante*/
      var Widvalor = find.byKey(ObjectKey("ValorAccion"));
      var Textvalor = Widvalor.evaluate().single.widget as Text;

      var Strvalor = Textvalor.data.toString();
      var finale = Strvalor.substring(15);

      int precio = 20000 - (int.parse(finale)*numAcc);

      print('Saldo: \$'+(precio.toString())+'\nNº acciones en ' + (textEmp.data as String) + ': '+ numAcc.toString());
      expect ( find.text('Saldo: \$'+(precio.toString())+'\nNº acciones en ' + (textEmp.data as String) + ': '+ numAcc.toString()) , findsOneWidget );
    });
  });

  testWidgets('Comprobar actualizacion historial', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.runAsync(() async {
      await tester.pumpWidget(const MyApp());

      var nombreEmp = find.byKey(ObjectKey("nombreEmp"));
      var textEmp = nombreEmp.evaluate().single.widget as Text;

      /*expect ( find.text('Saldo: \$20000\nNº acciones en ' + (textEmp.data as String) + ': 0') , findsOneWidget );
      print('Saldo: \$20000\nNº acciones en ' + (textEmp.data as String) + ': 0');
      print("\n");*/

      //Introducimos en el campo de texto las acciones que vamos a comprar
      var numAcc = 2;
      await tester.enterText(find.byKey(ObjectKey("CampoComprar")), numAcc.toString());

      /*Buscamos el boton de compra mediante el campo key
      * Bajamos la pantalla hasta que el botón sea visible
      * Pulsamos el botón para comprar el número de acciones indicado
      * */
      var botonC = find.byKey(ObjectKey("botonCompra"));
      await tester.dragUntilVisible(
        botonC,
        find.byType(SingleChildScrollView),
        const Offset(0, 600),
      );
      await tester.tap(botonC);
      await tester.pump();

      /*Buscamos el campo con el valor actual de la acción
      * De ese campo sacamos el un int con el valor de la acción y se lo restamos a 20000
      * para obtener el saldo restante*/
      var Widvalor = find.byKey(ObjectKey("ValorAccion"));
      var Textvalor = Widvalor.evaluate().single.widget as Text;

      var Strvalor = Textvalor.data.toString();
      var finale = Strvalor.substring(15);

      int precioAcciones = (int.parse(finale)*numAcc);
      //int SaldoRestante = 20000 - precioAcciones;

      /*print('Saldo: \$'+(precio.toString())+'\nNº acciones en ' + (textEmp.data as String) + ': '+ numAcc.toString());
      expect ( find.text('Saldo: \$'+(precio.toString())+'\nNº acciones en ' + (textEmp.data as String) + ': '+ numAcc.toString()) , findsOneWidget );
      */

      String Texthistorial = numAcc.toString() + " acciones compradas de " + (textEmp.data as String) +
          " al precio de \$" +precioAcciones.toString() + " , \$" + finale +" por accion";

      var botonHistory = find.byKey(ObjectKey("Pesta3"));
      //var tab = botonHistory.evaluate().single.widget;
      await tester.tap(botonHistory);
      //await tester.pump();
      //await tester.widget(botonHistory);

      var historial = find.byKey(ObjectKey("TextHistorico"));
      print(historial);
      //var StrHistorico = textHistorico.toString();

      //expect(find.text(Texthistorial), findsOneWidget);
    });
  });
}
