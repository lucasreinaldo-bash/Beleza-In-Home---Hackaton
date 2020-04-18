import 'package:compreai/Salao/products_tabTwo.dart';
import 'package:compreai/tabs/products_tab.dart';
import 'package:flutter/material.dart';

class ProdutosTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Produtos e Serviços",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
        ),
        centerTitle: true,
      ),
      body: ProductTabTwo(),
    );
  }
}
