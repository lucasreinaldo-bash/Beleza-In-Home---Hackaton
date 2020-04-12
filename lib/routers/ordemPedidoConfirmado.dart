import 'package:flutter/material.dart';

class OrdemPedidoConfirmado extends StatelessWidget {
  final String orderId;

  OrdemPedidoConfirmado(this.orderId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedido Realizado"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check,
              color: Colors.green,
              size: 80,
            ),
            Text(
              "O seu pedido foi realizado com sucesso",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Código do pedido: $orderId",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "Aguarde nossa confirmação por WhatsApp",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
