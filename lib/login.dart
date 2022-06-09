import 'package:flutter/material.dart';
import 'dart:async';
import 'package:proyecto_bolsa/myhomepage.dart';
import 'package:proyecto_bolsa/API.dart';

class login extends StatefulWidget{
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login>{
  TextEditingController usuario = new TextEditingController();
  TextEditingController contrasena = new TextEditingController();
  bool _usuarioIntroducido = false;
  Future<Usuario>? _usuarioFuture;

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
                key: ObjectKey("usuario"),
                controller: usuario,
                decoration: InputDecoration(
                  hintText: "Usuario"
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                key: ObjectKey("contraseña"),
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
                  key: ObjectKey("boton"),
                  child: Text("Login",style: TextStyle(color:Colors.white,fontSize: 20),),
                  onPressed: (){comprobarLog();},
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
                  onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) =>register()));},
                ),
              ),

              if (_usuarioIntroducido)
                FutureBuilder<Usuario>(
                    future: _usuarioFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.done){
                        if (snapshot.hasData) {
                          bool correcta = comprobarContrasena(snapshot.data.toString());

                          if(correcta){
                            Future.delayed(Duration.zero,(){
                              abrirApp();
                            });
                            return const CircularProgressIndicator();
                          }
                          else
                            return Text("Contraseña incorrecta");
                        }
                        else if (snapshot.hasError) {
                          return Text("El usuario no existe");
                        }
                      }
                      return const CircularProgressIndicator();
                    })


              else
                const Text("")
            ],
          ),
        )
      ),


    );
  }

  void comprobarLog(){
      _usuarioIntroducido = true;
      setState(() {
        _usuarioFuture = Usuario.getUsuario(usuario.text);
      });

  }

  bool comprobarContrasena(String datos){
    String p = "";
    int posicionP = datos.indexOf("password: \'")+11;
    for(int i = posicionP; datos[i]!="\'"; i++){
      p+=datos[i];
    }

    return (p==contrasena.text);
  }

  void abrirApp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>MyHomePage(title: 'Bolsa Home Page', usuario: usuario.text)));
  }
}

class register extends StatefulWidget{
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController usuario = new TextEditingController();
  TextEditingController contrasena = new TextEditingController();
  bool _datosIntroducidos = false;
  Future<Usuario>? _usuarioFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(left: 55, right: 55),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Proyecto Bolsa", style: TextStyle(color: Colors.white,
                  fontSize: 55,
                  backgroundColor: Colors.blue,)),
                SizedBox(height: 80,),
                Text("Registrar", style: TextStyle(color: Colors.white,
                  fontSize: 20,
                  backgroundColor: Colors.blue,)),
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
                    child: Text("Registrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),),
                    onPressed: () {
                      registrar();
                    },
                  ),
                ),

                if (_datosIntroducidos)
                  if(usuario.text!="" && contrasena.text!="")
                    FutureBuilder<Usuario>(
                        future: _usuarioFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                                Future.delayed(Duration.zero, () {
                                  abrirApp();
                                });
                                return const CircularProgressIndicator();

                            }
                            else if (snapshot.hasError) {
                              return Text("El nombre de usuario ya existe");
                            }
                          }
                          return const CircularProgressIndicator();
                        })

                    else if(usuario.text=="")
                      const Text("Campo usuario vacío")

                    else
                      const Text("Campo contraseña vacío")
                else
                  const Text("")
              ],
            ),
          )
      ),


    );
  }

  void registrar() {
    _datosIntroducidos = true;
    setState(() {
      _usuarioFuture = Usuario.createUsuario(name: usuario.text,password: contrasena.text);
    });
  }

  void abrirApp() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => MyHomePage(title: 'Bolsa Home Page', usuario: usuario.text)));
  }
}