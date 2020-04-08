import 'package:compreai/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Login.dart';

class PerfilUsuario extends StatefulWidget {
  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if (model.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Minhas Informações",
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      model.signOut();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text("Desconectar"),
                  ),
                )
              ],
            ));
      },
    );
  }
}
