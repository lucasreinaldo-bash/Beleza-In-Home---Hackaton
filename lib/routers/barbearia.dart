import 'package:carousel_pro/carousel_pro.dart';
import 'package:compreai/Salao/PrincipalBottomTwo.dart';
import 'package:flutter/material.dart';

import '../PrincipalBottom.dart';

class Barbearia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/fundocuston.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: null /* add child content content here */,
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 90),
              child: Center(
                  child: Card(
                elevation: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(90.0),
                    side: BorderSide(color: Colors.white30)),
                child: Container(
                    width: 180.0,
                    height: 180.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage("assets/transformation.jpg"),
                        ))),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 60,
                ),
                Text(
                  "Avaliação média: ",
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 60,
                ),
                Text(
                  "Horários de Atendimentos: ",
                  style: TextStyle(color: Colors.black38),
                ),
                Text(
                  "das 8 às 16hrs",
                  style: TextStyle(color: Colors.black38),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            OutlineButton(
              hoverColor: Colors.white,
              highlightColor: Colors.white70,
              highlightElevation: 10,
              child: Text('Fazer Solicitação'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PrincipalTwo()));
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
                width: 110,
                height: 30,
                child: Row(
                  children: <Widget>[
                    Text('Chat Online  '),
                    Icon(
                      Icons.chat,
                      color: Colors.green.shade600,
                    )
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Principal()));
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
        )
      ],
    ));
  }
}
