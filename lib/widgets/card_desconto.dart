import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardDesconto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(
          "Cupom de desconto",
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        leading: Icon(Icons.card_giftcard),
        trailing: Icon(Icons.add),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Digite o seu cupom"),
              initialValue: CartModel.of(context).cupomDesconto ?? "",
              onFieldSubmitted: (text) {
                Firestore.instance
                    .collection("cuponsDesconto")
                    .document(text)
                    .get()
                    .then((docSnap) {
                  if (docSnap.data != null) {
                    CartModel.of(context)
                        .setCupon(text, docSnap.data["percentual"]);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Desconto de ${docSnap.data["percentual"]}% aplicado",
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.purple,
                    ));
                  } else {
                    CartModel.of(context).setCupon(null, 0);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Cupom inválido", textAlign: TextAlign.center),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
