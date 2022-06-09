// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:proyecto_bolsa/main.dart';
import 'package:proyecto_bolsa/myhomepage.dart';

void main() {
  testWidgets('Iniciar sesion', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.runAsync(() async {
      await tester.pumpWidget(const MyApp());

      //Introducimos el login
      var usuario = "Prueba";
      await tester.enterText(find.byKey(ObjectKey("usuario")), usuario);

      //Introducimos la contraseña
      var contrasenia = "Prueba";
      await tester.enterText(find.byKey(ObjectKey("contraseña")), contrasenia);

      //Pulsamos el boton
      var boton = find.byKey(ObjectKey("boton"));
      await tester.tap(boton);
      await tester.pump();

      //El usuario existe y la contraseña no es incorrecta
      expect ( find.text('El usuario no existe') , findsNothing );
      expect ( find.text('Contraseña incorrecta') , findsNothing );
      /*print('Saldo: \$20000\nNº acciones en ' + (textEmp.data as String) + ': 0');
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
      expect ( find.text('Saldo: \$'+(precio.toString())+'\nNº acciones en ' + (textEmp.data as String) + ': '+ numAcc.toString()) , findsOneWidget );*/
    });
  });

  testWidgets('Comprobar actualizacion historial', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.runAsync(() async {
      await tester.pumpWidget(const MyApp());
      var nombreEmp = find.byKey(ObjectKey("nombreEmp"));
      var textEmp = nombreEmp.evaluate().single.widget as Text;

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


      /*Generamos la cadena que debería salir tras comprar acciones
      * */
      String Texthistorial =" " + numAcc.toString() + " acciones compradas de " + (textEmp.data as String) +
          " al precio de \$" +precioAcciones.toString() + " , \$" + finale +" por accion\n";

      /*Buscamos el botón para cambiar de pestaña
      * y nos movemos a la tercera, la del historial*/
      var botonHistory = find.byKey(ObjectKey("Pesta3"));
      await tester.tap(botonHistory);
      await tester.pumpAndSettle();

      /*En la pestaña del historial buscamos que tras la compra, esta
      * se haya reflejado en esta pestaña comparando su contenido con
      * la cadena que hemos creado anteriormente*/
      var historial = find.byKey(ObjectKey("TextHistorico"));
      var aux = historial.evaluate().single.widget as Text;
      var StrHistorico = aux.data.toString();

      print (Texthistorial);
      expect(StrHistorico, Texthistorial);
    });
  });

  testWidgets('Comprobar boton actualizar cambia valor de las acciones', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.runAsync(() async {
      await tester.pumpWidget(const MyHomePage(title: 'Bolsa Home Page', usuario: "Prueba"));

      //var nombreEmp = find.byKey(ObjectKey("nombreEmp"));
      //var textEmp = nombreEmp.evaluate().single.widget as Text;

      /*Buscamos el campo con el valor actual de la acción
      * De ese campo sacamos el un int con el valor de la acción
      * */
      var Widvalor = find.byKey(ObjectKey("ValorAccion"));
      var Textvalor = Widvalor.evaluate().single.widget as Text;
      var Strvalor = Textvalor.data.toString();

      /*Buscamos el boton de compra mediante el campo key
      * Bajamos la pantalla hasta que el botón sea visible
      * Pulsamos el botón para comprar el número de acciones indicado
      * */
      var botonAct = find.text("Actualizar");
      await tester.dragUntilVisible(
        botonAct,
        find.byType(SingleChildScrollView),
        const Offset(0, 600),
      );
      await tester.tap(botonAct);
      await tester.pump();

      /*Buscamos el campo con el valor actual de la acción
      * De ese campo sacamos el un int con el valor de la acción
      * */
      var WidvalorF = find.byKey(ObjectKey("ValorAccion"));
      var TextvalorF = WidvalorF.evaluate().single.widget as Text;
      var StrvalorF = TextvalorF.data.toString();

      print(Strvalor);
      print(StrvalorF);

      expect(find.text(Strvalor),findsNothing);
    });
  });

}
