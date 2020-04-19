import 'package:carousel_pro/carousel_pro.dart';
import 'package:compreai/Salao/PrincipalBottomTwo.dart';
import 'package:compreai/routers/Registrar.dart';
import 'package:compreai/routers/start_page.dart';
import 'package:flutter/material.dart';

import '../PrincipalBottom.dart';

class RegistrarEmpresaIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/fundoregistro.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: null /* add child content content here */,
        ),
        Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 500,
              ),
              OutlineButton(
                hoverColor: Colors.white,
                highlightColor: Colors.white70,
                highlightElevation: 10,
                child: Container(
                  width: 150,
                  height: 30,
                  child: Row(
                    children: <Widget>[
                      Text('Seja nosso parceiro'),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Registrar()));
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
              OutlineButton(
                hoverColor: Colors.white,
                highlightColor: Colors.white70,
                highlightElevation: 10,
                child: Container(
                  width: 150,
                  height: 30,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Voltar para tela inicial',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => StartPage()));
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
          ),
        )
      ],
    ));
  }
}
