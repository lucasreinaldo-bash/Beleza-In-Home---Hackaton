import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:compreai/main.dart';
import 'package:compreai/routers/geolocalizacaoUsuario.dart';
import 'package:compreai/routers/shopbarber.dart';
import 'package:flutter/material.dart';

import '../PrincipalBottom.dart';
import 'Login.dart';
import 'barbearia.dart';

class RecepcaoUsuarioLocalizado extends StatefulWidget {
  bool _obscureTextLogin = true;

  @override
  _RecepcaoUsuarioState createState() => _RecepcaoUsuarioState();
}

class _RecepcaoUsuarioState extends State<RecepcaoUsuarioLocalizado> {
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<String> listaTela = new List();
  CarouselSlider instance;
  bool _obscureTextLogin = true;
  TextEditingController _buscaController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listaTela.add("Lucas");
    listaTela.add("Marcos");
    listaTela.add("Joao");
    listaTela.add("Mateus");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/belezainhome.png',
                  width: 150,
                  height: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    color: Colors.white70,
                    child: Padding(
                        padding: EdgeInsets.only(left: 11),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                TextField(
                                  controller: _buscaController,
                                  obscureText: _obscureTextLogin,
                                  style: TextStyle(
                                      fontFamily: "WorkSansSemiBold",
                                      fontSize: 17.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hoverColor: Colors.green.shade900,
                                    hintText: "O que você procura ?",
                                    hintStyle: TextStyle(
                                        color: Colors.green.shade900,
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 17.0),
                                    suffixIcon: GestureDetector(
                                      child: Icon(
                                        _obscureTextLogin
                                            ? Icons.search
                                            : Icons.youtube_searched_for,
                                        size: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 60, bottom: 50),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Você está em Alagoinhas-Bahia",
                        style: TextStyle(color: Colors.green.shade900),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.my_location,
                        color: Colors.green.shade100,
                      )
                    ],
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Mais avaliados da semana",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black54),
                        ),
                        Icon(
                          Icons.stars,
                          color: Colors.amber,
                        )
                      ],
                    ),
                  )),
              SizedBox(
                  height: 200.0,
                  width: 350.0,
                  child: Carousel(
                    images: [
                      Image.asset("assets/1.png"),
                      Image.asset("assets/cortaqui.png"),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Barbearia()));
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                                "assets/barbeariatransformacao.png"),
                          ),
                        ),
                      ),
                      Image.asset("assets/makeup.png"),
                      Image.asset("assets/esmalteria.png"),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.lightGreenAccent,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.green.withOpacity(0.5),
                    borderRadius: true,
                    moveIndicatorFromBottom: 180.0,
                    noRadiusForIndicator: true,
                  )),
              Column(
                children: <Widget>[
                  Text(
                    "Salões e Barberias",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black54),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Barbearia()));
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                    "assets/barbeariatransformacao.png"),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ShopBarber()));
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/3.png"),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Barbearia()));
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/makeup.png"),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ShopBarber()));
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/3.png"),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Esmalterias e Lojas de Cosméticos",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black54),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Barbearia()));
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/esmalteria.png"),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Barbearia()));
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                    "assets/barbeariatransformacao.png"),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Barbearia()));
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                    "assets/barbeariatransformacao.png"),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Barbearia()));
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                    "assets/barbeariatransformacao.png"),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Barbearia()));
            },
            highlightElevation: 50,
            backgroundColor: Colors.white70,
            child: Padding(
              padding: EdgeInsets.all(3),
              child: Container(
                // Use the properties stored in the State class.
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                // Define how long the animation should take.
                // Provide an optional curve to make the animation feel smoother.
                child: Icon(
                  Icons.mic,
                  color: Colors.black54,
                ),
              ),
            )));
  }
}
