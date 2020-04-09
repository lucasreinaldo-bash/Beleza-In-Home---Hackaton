import 'package:compreai/tabs/products_tab.dart';
import 'package:flutter/material.dart';

class Produtos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Produtos",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
        ),
        centerTitle: true,
      ),
      body: ProductTab(),
    );
  }
}
