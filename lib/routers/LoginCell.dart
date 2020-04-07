import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
                  padding: EdgeInsets.all(60),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.green.withAlpha(144).withBlue(44),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1000))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute());
                            },
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.phone_android),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                  ),
                                  Text('Confirme seu número',
                                      style: TextStyle(fontSize: 15))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
