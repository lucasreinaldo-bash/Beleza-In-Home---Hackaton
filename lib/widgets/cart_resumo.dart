import 'package:compreai/models/cart_model.dart';
import 'package:compreai/routers/ordemPedidoConfirmado.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartResumo extends StatelessWidget {
  final VoidCallback buy;
  CartResumo(this.buy);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
          padding: EdgeInsets.all(16.0),
          child: ScopedModelDescendant<CartModel>(
            builder: (context, child, model) {
              double preco = model.getProductPrice();
              double desconto = model.getDesconto();
              double frete = model.getFrete();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Resumo do Pedido",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Subtotal"),
                      Text("R\$ ${preco.toStringAsFixed(2)}"),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Desconto"),
                      Text("- R\$ ${desconto.toStringAsFixed(2)}"),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Entrega"),
                      Text("R\$ ${frete.toStringAsFixed(2)}"),
                    ],
                  ),
                  Divider(
                    color: Colors.brown,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      Text(
                        "R\$ ${(preco + frete - desconto).toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )
                    ],
                  ),
                  RaisedButton(
                    onPressed: () async {
                      String ordemId = await model.finalizarCompra();
                      if (ordemId != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                OrdemPedidoConfirmado(ordemId)));
                      }
                    },
                    child: Text(
                      "Finalizar Pedido",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.purple,
                  )
                ],
              );
            },
          )),
    );
  }
}
