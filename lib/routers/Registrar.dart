import 'package:compreai/models/user_model.dart';
import 'package:compreai/utils/animation_item.dart';
import 'package:compreai/widgets/logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:scoped_model/scoped_model.dart';

class Registrar extends StatefulWidget {
  final PageController pageController;
  final Color buttonColor;

  const Registrar({Key key, this.pageController, this.buttonColor})
      : super(key: key);

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

  //Animation
  List<AnimationItem> animationlist = [];
  double _scaleHolder = 0;
  @override
  void initState() {
    super.initState();
    delayAnimatiom(
        AnimationItem(
          name: 'padding_top_label',
          tween: Tween<double>(begin: 0.0, end: 1),
        ),
        Duration(milliseconds: 800), (animation) {
      setState(() {
        animationlist.add(animation);
      });
    });
    delayAnimatiom(
        AnimationItem(
          name: 'button_scale',
          tween: Tween<double>(begin: 0.0, end: 0.9),
        ),
        Duration(milliseconds: 1200), (animation) {
      setState(() {
        animationlist.add(animation);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TweenAnimationBuilder(
                                duration: Duration(milliseconds: 800),
                                curve: Curves.easeOutCubic,
                                tween: findAnimation(
                                    'padding_top_label', 20, animationlist),
                                builder: (context, value, child) {
                                  return Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 30,
                                            right: 30,
                                            top: _height * 0.28 + value),
                                        child: AnimatedOpacity(
                                          opacity: value == 20 ? 0 : 1,
                                          duration: Duration(milliseconds: 700),
                                          child: Text(
                                            'Olá humano,',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        child: AnimatedOpacity(
                                          opacity: value == 20 ? 0 : 1,
                                          duration: Duration(milliseconds: 800),
                                          child: Text(
                                            'eu sou Reflectly',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      TweenAnimationBuilder(
                                          duration:
                                              Duration(milliseconds: 1200),
                                          curve: Curves.easeOutCubic,
                                          tween: findAnimation(
                                              'padding_top_label',
                                              20,
                                              animationlist),
                                          builder:
                                              (context, paddingvalue, child) {
                                            return AnimatedOpacity(
                                              opacity:
                                                  paddingvalue == 20 ? 0 : 1,
                                              duration:
                                                  Duration(milliseconds: 1300),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 30,
                                                    right: 30,
                                                    top: 15 + paddingvalue),
                                                child: Text.rich(
                                                  TextSpan(
                                                    text:
                                                        'Seu novo companheiro de \n',
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'rotina e jornada',
                                                      )
                                                    ],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white70),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  );
                                }),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 60.0),
                              child: Column(
                                children: <Widget>[
                                  TweenAnimationBuilder(
                                    child: LogoWidget(),
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.elasticOut,
                                    tween: _scaleHolder == 0.0
                                        ? findAnimation(
                                            'button_scale', 0.0, animationlist)
                                        : Tween(begin: 0.9, end: 1.0),
                                    builder: (context, value, child) {
                                      return Transform.scale(
                                        scale: value,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 30),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black38,
                                                          offset: Offset(0, 10),
                                                          blurRadius: 15),
                                                    ],
                                                  ),
                                                  height: _height * 0.075,
                                                  child: RaisedButton(
                                                    onHighlightChanged:
                                                        (press) {
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
                                                    highlightColor:
                                                        Colors.white,
                                                    highlightElevation: 0,
                                                    elevation: 0,
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                    onPressed: () {
                                                      widget.pageController
                                                          .animateToPage(1,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      800),
                                                              curve: Curves
                                                                  .easeInCubic);
                                                    },
                                                    child: Text(
                                                      'OLÁ, REFLECTLY',
                                                      style: TextStyle(
                                                          color: widget
                                                              .buttonColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  TweenAnimationBuilder(
                                      //child: LogoWidget(),
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.elasticOut,
                                      tween: findAnimation(
                                          'button_scale', 0.0, animationlist),
                                      builder: (context, value, child) {
                                        return Transform.scale(
                                          scale: value,
                                          child: Text(
                                            'JÁ TENHO UMA CONTA',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            )
                          ],
                        ),
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
                            if (text.contains(""))
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
