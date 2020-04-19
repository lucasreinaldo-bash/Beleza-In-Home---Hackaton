import 'package:compreai/TelaInicial.dart';
import 'package:compreai/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../PrincipalBottom.dart';
import 'Registrar.dart';

class Login extends StatelessWidget {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double _scaleHolder = 0;

  @override
  Widget build(BuildContext context) {
    void _onSucess() {
      Future.delayed(Duration(seconds: 2)).then((_) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Principal()));
      });
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text("Entrar")),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Image.asset(
                  'assets/logonova.png',
                  width: 250,
                  height: 250,
                ),
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 1, 10, 0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.2,
                              color: Colors.blueAccent,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "E-mail",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text.isEmpty || (!text.contains("@")))
                            return "E-mail inválido";
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _senhaController,
                      decoration: InputDecoration(hintText: "Senha"),
                      obscureText: true,
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "Senha inválida!";
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: ScopedModelDescendant<UserModel>(
                      builder: (context, child, model) {
                        return Column(
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: <Widget>[
                                  RaisedButton(
                                    onHighlightChanged: (press) {
                                      setState(() {
                                        if (press) {
                                          _scaleHolder = 0.1;
                                        } else {
                                          _scaleHolder = 0.0;
                                        }
                                      });
                                    },
                                    hoverColor: Colors.white,
                                    hoverElevation: 0,
                                    highlightColor: Colors.white,
                                    highlightElevation: 0,
                                    elevation: 0,
                                    color: Colors.lightGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {}
                                      model.signIn(
                                          email: _emailController.text,
                                          pass: _senhaController.text,
                                          onSucess: _onSucess,
                                          onFail: _onFail);
                                    },
                                    child: Text(
                                      'Quero Comprar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {}
                                      model.signIn(
                                          email: _emailController.text,
                                          pass: _senhaController.text,
                                          onSucess: _onSucess,
                                          onFail: _onFail);
                                    },
                                    child: Text("Entrar"),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Registrar()));
                                    },
                                    child: Text("Fazer Cadastro"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ))
              ],
            )));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Houve um erro no seu login."),
      backgroundColor: Colors.blueGrey,
      duration: Duration(seconds: 2),
    ));
  }

  void setState(Null Function() param0) {}
}
