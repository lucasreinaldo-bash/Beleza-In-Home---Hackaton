import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/logonova.png',
              width: 350,
              height: 350,
            ),
          ),
          Text("Entrar")
        ],
      ),
    );
  }
}
