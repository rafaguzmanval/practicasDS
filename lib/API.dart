import 'dart:convert';
import 'package:http/http.dart' as http;

class Usuario {
  int id;
  String? usuario;
  String? contrasena;
  int? saldo;

  static const String _baseAddress = 'clados.ugr.es';

  static const String _applicationName = 'DS1_4/api/v1';

  Usuario(
      {required this.id, required this.usuario, required this.contrasena, required this.saldo});

  @override
  String toString() {
    return "id: $id, name: '$usuario', password: '$contrasena', saldo: $saldo";
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': usuario,
        'password': contrasena,
        'saldo': saldo
      };

  Usuario.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        usuario = json['name'],
        contrasena=json['password'],
        saldo = json['saldo'];

  //////////// get //////////////////
  static Future<Usuario> getUsuario(String name) async {
    var uri = Uri.https(_baseAddress, '$_applicationName/jugadors/' + name);
    final response = await http.get(uri
        , headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "Access-Control-Allow-Origin, Accept"
        });

    if (response.statusCode == 200) {
      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get jugador');
    }
  }

  ////////////// create ///////////////

  static Future<Usuario> createUsuario(
      {String name = "", String password = ""}) async {
    var uri = Uri.https(_baseAddress, '$_applicationName/jugadors/');
    final response = await http.post(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'password': password
      }),
    );
    if (response.statusCode == 201)
      return Usuario.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to create jugador');
  }
}

class EmpresaAPI {
  int id;
  String? nombre;
  int? acciones;
  int? valor;

  static const String _baseAddress = 'clados.ugr.es';

  static const String _applicationName = 'DS1_4/api/v1';

  EmpresaAPI(
      {required this.id, required this.nombre, required this.acciones, required this.valor});

  @override
  String toString() {
    return "id: $id, name: '$nombre', valor: $valor, acciones: $acciones";
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': nombre,
        'valor': valor,
        'acciones': acciones
      };

  EmpresaAPI.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        nombre = json['name'],
        valor=json['valor'],
        acciones = json['acciones'];

  //////////// get //////////////////
  static Future<List<EmpresaAPI>> getEmpresas() async {
    var uri = Uri.https(_baseAddress, '$_applicationName/empresas/');
    final response = await http.get(uri
        , headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "Access-Control-Allow-Origin, Accept"
        });

    if (response.statusCode == 200) {
      List<EmpresaAPI> empresas = [];
      var respuesta = "";

      for(var i = 1; i<response.body.length; i++){
        respuesta+=response.body[i];
        if(response.body[i]=='}'){
          var elemento = EmpresaAPI.fromJson(jsonDecode(respuesta));
          empresas.add(elemento);
          respuesta = "";
          i++;
        }
      }

      return empresas;
    } else {
      throw Exception('Failed to get jugador');
    }
  }
}

class AccionesAPI {
  int id;
  String? usuario;
  String? contrasena;
  int? saldo;

  static const String _baseAddress = 'clados.ugr.es';

  static const String _applicationName = 'DS1_4/api/v1';

  AccionesAPI(
      {required this.id, required this.usuario, required this.contrasena, required this.saldo});

  @override
  String toString() {
    return "id: $id, name: '$usuario', password: '$contrasena', saldo: $saldo";
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': usuario,
        'password': contrasena,
        'saldo': saldo
      };

  AccionesAPI.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        usuario = json['name'],
        contrasena=json['password'],
        saldo = json['saldo'];

  //////////// get //////////////////
  static Future<AccionesAPI> getAcciones(String name) async {
    var uri = Uri.https(_baseAddress, '$_applicationName/jugadors/' + name);
    final response = await http.get(uri
        , headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "Access-Control-Allow-Origin, Accept"
        });

    if (response.statusCode == 200) {
      return AccionesAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get jugador');
    }
  }

  ////////////// create ///////////////
  static Future<AccionesAPI> createAcciones(
      {String name = "", String password = ""}) async {
    var uri = Uri.https(_baseAddress, '$_applicationName/jugadors/');
    final response = await http.post(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'password': password
      }),
    );
    if (response.statusCode == 201)
      return AccionesAPI.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to create jugador');
  }
}