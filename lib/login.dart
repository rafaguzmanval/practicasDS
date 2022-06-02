import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Usuario{
  String? usuario;
  String? contrasena;
  int? saldo;

  static const  String _baseAddress='clados.ugr.es';

  static const  String _applicationName='DS1_4/api/v1/';

  Usuario({required this.usuario, required this.contrasena, required this.saldo});

  @override
  String toString()
  {
    return "name: '$usuario', password: '$contrasena', saldo: $saldo";
  }

  Map<String, dynamic> toJson() => {
    'name': usuario,
    'password': contrasena,
    'saldo': saldo
  };

  Usuario.fromJson(Map<String, dynamic> json):
        usuario = json['name'],
        contrasena=json['password'],
        saldo = json['saldo'];

  //////////// get //////////////////
  static Future<Usuario> getUsuario(String name) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/jugadors/$name'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get project');
    }
  }
}

class login extends StatefulWidget{
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login>{
  TextEditingController usuario = new TextEditingController();
  TextEditingController contrasena = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left:55,right: 55),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Proyecto Bolsa",style: TextStyle(color:Colors.white,fontSize: 55,backgroundColor: Colors.blue,)),
              SizedBox(height: 80,),
              TextField(
                controller: usuario,
                decoration: InputDecoration(
                  hintText: "Usuario"
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: contrasena,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Contraseña"
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: FlatButton(
                  child: Text("Login",style: TextStyle(color:Colors.white,fontSize: 20),),
                  onPressed: (){return comprobarLog();},
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: FlatButton(
                  child: Text("Registrarse",style: TextStyle(color:Colors.white,fontSize: 10),),
                  onPressed: (){},
                ),
              )
            ],
          ),
        )
      )
    );
  }

  void comprobarLog(){
    print(Usuario.getUsuario(usuario.text));
  }
}