import 'package:compreai/models/cart_model.dart';
import 'package:compreai/models/user_model.dart';
import 'package:compreai/routers/ordemPedidoConfirmado.dart';
import 'package:compreai/tiles/CartTile.dart';
import 'package:compreai/widgets/card_desconto.dart';
import 'package:compreai/widgets/cart_resumo.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'CartTileTwo.dart';
import 'cart_modelTwo.dart';

class CartScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Meu Carrinho",
          style: TextStyle(
              color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModelTwo>(
              builder: (context, child, model) {
                int p = model.products.length;
                return Text(
                  "${p ?? 0} ${p == 1 ? "ITEM" : "ITENS"}",
                  style: TextStyle(color: Colors.deepOrange),
                );
              },
            ),
          ),
        ],
      ),
      body:
          ScopedModelDescendant<CartModelTwo>(builder: (context, child, model) {
        if (model.isLoading && UserModel.of(context).isLoggedIn()) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!UserModel.of(context).isLoggedIn()) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.remove_shopping_cart,
                  size: 80,
                  color: Colors.purple,
                ),
                SizedBox(height: 16),
                Text(
                  "Faça o login para adicionar produtos!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                RaisedButton(
                  color: Colors.purple,
                  onPressed: () {},
                  child: Text(
                    "Entrar",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          );
        } else if (model.products == null || model.products.length == 0) {
          return Center(
            child: Text(
              "Seu carrinho está vazio",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return ListView(
            children: <Widget>[
              Column(
                children: model.products.map((product) {
                  return CartTileTwo(product);
                }).toList(),
              ),
              CardDesconto(),
              CartResumo(() async {
                String orderId = await model.finalizarCompra();
              }),
            ],
          );
        }
      }),
    );
  }
}
