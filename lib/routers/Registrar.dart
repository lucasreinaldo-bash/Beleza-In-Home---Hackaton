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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(""),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Padding(
              padding: EdgeInsets.all(1),
              child: Card(
                child: Form(
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(1),
                            child: Center(
                                child: Image.asset(
                              "assets/in.png",
                              width: 100,
                              height: 100,
                            ))),
                        Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Preencha o formulário e aguarde o nosso contato.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black87),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: "Nome da Empresa",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.green.shade500,
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
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
                              decoration: InputDecoration(
                                hintText: "E-mail",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.green.shade500,
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
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
                              decoration: InputDecoration(
                                hintText: "Telefone para contato",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.green.shade500,
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              controller: _cidadeController,
                              decoration: InputDecoration(
                                hintText: "Cidade",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.green.shade500,
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              validator: (text) {
                                if (text.isEmpty) return "Cidade de atuação";
                              },
                            ),
                          ],
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: <Widget>[
                                    Center(
                                      child: OutlineButton(
                                        hoverColor: Colors.white,
                                        highlightColor: Colors.white70,
                                        highlightElevation: 10,
                                        child: Text('Enviar Solicitação'),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
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
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Colors
                                                    .white30)), // callback when button is clicked
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blueGrey, //Color of the border
                                          style: BorderStyle
                                              .solid, //Style of the border
                                          width: 0.8, //width of the border
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ))
                      ],
                    )),
              ),
            );
          },
        ));
  }

  void _onSucess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
          "Recebemos sua solicitação. Nossa equipe entrará em contato com você !"),
      backgroundColor: Colors.blueGrey,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Problema ao enviar formulário."),
      backgroundColor: Colors.blueGrey,
      duration: Duration(seconds: 2),
    ));
  }
}
