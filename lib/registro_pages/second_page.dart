import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key key}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with AutomaticKeepAliveClientMixin {
  String _nikname = '';
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: _height * 0.23),
      child: Column(
        children: <Widget>[
          Text(
            'Qual o seu nome ?',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: EdgeInsets.only(top: _height * 0.1),
            child: SingleChildScrollView(
                child: Card(
              color: Colors.transparent,
              elevation: 40,
              child: Padding(
                padding: EdgeInsets.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Qual o seu nome ?',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(hintText: "Nome Completo"),
                      keyboardType: TextInputType.text,
                      validator: (text) {
                        if (text.isEmpty) return "Campo não pode ficar vazio.";
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'E o seu e-mail ?',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(hintText: "E-mail"),
                      keyboardType: TextInputType.text,
                      validator: (text) {
                        if (text.isEmpty) return "Campo não pode ficar vazio.";
                      },
                    ),
                  ],
                ),
              ),
            )),
          )
        ],
      ),
    );
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

  @override
  bool get wantKeepAlive => true;
}
