import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/datas/cart_product.dart';
import 'package:compreai/datas/product_data.dart';
import 'package:compreai/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final CartProduct cartProduct;

  CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            child: Image.network(
              cartProduct.productData.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    cartProduct.productData.title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  Text(
                    cartProduct.variacao,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Text(
                    "R\$ " + cartProduct.productData.price.toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: cartProduct.quantidade > 1
                            ? () {
                                CartModel.of(context).decProduct(cartProduct);
                              }
                            : null,
                      ),
                      Text(cartProduct.quantidade.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          CartModel.of(context).incProduct(cartProduct);
                        },
                      ),
                      FlatButton(
                        onPressed: () {
                          CartModel.of(context).removeCartItem(cartProduct);
                        },
                        child: Text("Remover"),
                        textColor: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    return Card(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: cartProduct.productData == null
            ? FutureBuilder<DocumentSnapshot>(
                future: Firestore.instance
                    .collection("hackaton")
                    .document(cartProduct.categoria)
                    .collection("itens")
                    .document(cartProduct.pid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    cartProduct.productData =
                        ProductData.fromDocument(snapshot.data);
                    return _buildContent();
                  } else {
                    return Container(
                      height: 70,
                      child: CircularProgressIndicator(),
                      alignment: Alignment.center,
                    );
                  }
                },
              )
            : _buildContent());
  }
}
