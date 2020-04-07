import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneVerify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/logonova.png',
                  width: 350,
                  height: 350,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(hintText: "E-mail"),
                              ),
                              TextFormField(
                                decoration: InputDecoration(hintText: "Senha"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          RaisedButton(
            child: Text("Entrar"),
            color: Colors.blue.shade300,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
