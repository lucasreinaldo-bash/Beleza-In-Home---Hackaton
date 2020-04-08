import 'package:compreai/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:scoped_model/scoped_model.dart';

class Registrar extends StatefulWidget {
  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Registrar"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Form(
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
                          child: Text(
                            "Dados Pessoais",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                        TextFormField(
                          controller: _nameController,
                          decoration:
                              InputDecoration(hintText: "Nome Completo"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text.isEmpty)
                              return "Campo não pode ficar vazio.";
                          },
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
                            if (text.contains(" "))
                              return "Remova os espaços em branco";
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
                            if (text.contains(" "))
                              return "Sua senha possui espaços em branco";
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _cidadeController,
                          decoration: InputDecoration(hintText: "Cidade"),
                          validator: (text) {
                            if (text.isEmpty) return "Cidade Inválida";
                          },
                        ),
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      Map<String, dynamic> userData = {
                                        "nome": _nameController.text,
                                        "email": _emailController.text,
                                        "pass": _senhaController.text,
                                        "cidade": _cidadeController.text,
                                      };
                                      model.signUp(
                                          userData: userData,
                                          pass: _senhaController.text,
                                          onSucess: _onSucess,
                                          onFail: _onFail);
                                    }
                                    ;
                                  },
                                  child: Text("Registrar"),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                RaisedButton(
                                  onPressed: () {},
                                  child: Text("Voltar"),
                                ),
                              ],
                            )
                          ],
                        ))
                  ],
                ));
          },
        ));
  }

  void _onSucess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Conta criada com sucesso!"),
      backgroundColor: Colors.blueGrey,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Problema ao criar sua conta."),
      backgroundColor: Colors.blueGrey,
      duration: Duration(seconds: 2),
    ));
  }
}
