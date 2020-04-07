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

  @override
  Widget build(BuildContext context) {
    void _onSucess() {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Conta criada com sucesso!"),
        backgroundColor: Colors.blueGrey,
        duration: Duration(seconds: 2),
      ));
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
              padding: EdgeInsets.all(16),
              children: <Widget>[
                Image.asset(
                  'assets/logonova.png',
                  width: 100,
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: "E-mail"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text.isEmpty || (!text.contains("@")))
                          return "E-mail inválido";
                      },
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
      content: Text("Problema ao criar sua conta."),
      backgroundColor: Colors.blueGrey,
      duration: Duration(seconds: 2),
    ));
  }
}
