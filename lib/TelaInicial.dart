import 'package:compreai/tabs/InicioTab.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
//      physics: NeverScrollableScrollPhysics(),/* trecho para evitar a passagem de elementos através deslise    */
      children: <Widget>[InicioTab()],
    );
  }
}
