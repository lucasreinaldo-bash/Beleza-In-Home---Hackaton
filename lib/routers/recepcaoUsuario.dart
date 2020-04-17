import 'package:compreai/main.dart';
import 'package:compreai/routers/geolocalizacaoUsuario.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class RecepcaoUsuario extends StatefulWidget {
  @override
  _RecepcaoUsuarioState createState() => _RecepcaoUsuarioState();
}

class _RecepcaoUsuarioState extends State<RecepcaoUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Image.asset(
                'assets/carasentado.png',
                width: 400,
                height: 300,
              ),
            ),
            Image.asset(
              'assets/hair_pin.png',
              width: 200,
              height: 200,
            ),
            OutlineButton(
              hoverColor: Colors.white,
              highlightColor: Colors.white70,
              highlightElevation: 10,
              child: Text('Definir Localização'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GeolocalizacaoUsuario()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(
                      color:
                          Colors.white30)), // callback when button is clicked
              borderSide: BorderSide(
                color: Colors.blueGrey, //Color of the border
                style: BorderStyle.solid, //Style of the border
                width: 0.8, //width of the border
              ),
            ),
          ],
        ));
  }
}
