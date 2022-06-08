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

  /////////// update /////////

  static Future<Usuario> updateUsuario(
      {String? saldo, required String id}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/jugadors/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control_Allow_Origin": "Access-Control-Allow-Origin, Accept"
      },
      body: jsonEncode(<String, String>{
        'name': id,
        'saldo': saldo!,
      }),
    );
    if (response.statusCode == 200) {
      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Usuario');
    }
  }


}

class EmpresaAPI {
  int id;
  String nombre;
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

  String getNombre(){
    return nombre;
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
      throw Exception('Failed to get empresas');
    }
  }

  static Future<EmpresaAPI> getEmpresa(String id) async {
    var uri = Uri.https(_baseAddress, '$_applicationName/empresas/' + id);
    final response = await http.get(uri
        , headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "Access-Control-Allow-Origin, Accept"
        });

    if (response.statusCode == 200) {
      return EmpresaAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get empresa');
    }
  }

  //////////////// UPDATE ///////////////////////
  static Future<EmpresaAPI> updateEmpresa(
      {String? valor, required String id}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/empresas/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control_Allow_Origin": "Access-Control-Allow-Origin, Accept"
      },
      body: jsonEncode(<String, String>{
        'name': id,
        'valor': valor!,
      }),
    );
    if (response.statusCode == 200) {
      return EmpresaAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Empresa');
    }
  }
}

class AccionesAPI {
  int id;
  int numero;
  int jugador_id;
  int empresa_id;

  static const String _baseAddress = 'clados.ugr.es';

  static const String _applicationName = 'DS1_4/api/v1';

  AccionesAPI(
      {required this.id, required this.numero, required this.empresa_id, required this.jugador_id});


  @override
  String toString() {
    return "id: $id, numero: '$numero', empresa: $empresa_id, jugador: $jugador_id";
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'numero': numero,
        'empresa_id': empresa_id,
        'jugador_id': jugador_id
      };

  AccionesAPI.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        numero = json['numero'],
        empresa_id= json['empresa_id'],
        jugador_id= json['jugador_id'];

  static void comprar(int numero, String empresa, String jugador) async {
    var j = await Usuario.getUsuario(jugador);
    var e = await EmpresaAPI.getEmpresa(empresa);
    AccionesAPI.createAccion(numero: numero.toString(), empresa_id: e.id.toString(), jugador_id: j.id.toString());
  }

  static void vender(int numero, String empresa, String jugador) async {
    var j = await Usuario.getUsuario(jugador);
    var e = await EmpresaAPI.getEmpresa(empresa);
    AccionesAPI.updateAccion(numero: numero.toString(), empresa_id: e.id.toString(), jugador_id: j.id.toString());
  }

  //////////// get //////////////////
  static Future<List<AccionesAPI>> getAcciones(String id) async {
    var uri = Uri.https(_baseAddress, '$_applicationName/acciones/'+id);
    final response = await http.get(uri
        , headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "Access-Control-Allow-Origin, Accept"
        });

    if (response.statusCode == 200) {
      List<AccionesAPI> acciones = [];
      var respuesta = "";

      for(var i = 1; i<response.body.length; i++){
        respuesta+=response.body[i];
        if(response.body[i]=='}'){
          var elemento = AccionesAPI.fromJson(jsonDecode(respuesta));
          acciones.add(elemento);
          respuesta = "";
          i++;
        }
      }

      return acciones;
    } else {
      throw Exception('Failed to get acciones');
    }
  }


  static Future<AccionesAPI> createAccion(
      {required String numero, required String empresa_id, required String jugador_id}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/acciones/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'numero': numero,
        'empresa_id': empresa_id,
        'jugador_id': jugador_id
      }),
    );

    if (response.statusCode == 201) {
      return AccionesAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create accion');
    }
  }


  /////////// update /////////

  static Future<AccionesAPI> updateAccion({String? numero, String? empresa_id, String? jugador_id}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/acciones/$jugador_id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'numero' : numero!,
        'empresa_id': empresa_id!,
        'jugador_id': jugador_id!,
      }),
    );
    if (response.statusCode == 200) {
      return AccionesAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update accion');
    }
  }
}

class Reloj{
  int id;
  int valor;

  static const String _baseAddress = 'clados.ugr.es';

  static const String _applicationName = 'DS1_4/api/v1';

  Reloj(
      {required this.id, required this.valor});

  @override
  String toString() {
    return "id: $id, valor: '$valor'";
  }

  //////////// get //////////////////
  static Future<String> getReloj() async {
    var uri = Uri.https(_baseAddress, '$_applicationName/relojs/1');
    final response = await http.get(uri
        , headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "Access-Control-Allow-Origin, Accept"
        });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get reloj');
    }
  }

}