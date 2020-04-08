import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/datas/product_data.dart';

class CartProduct {
  String cid;
  String categoria;
  String pid;
  int quantidade;
  String variacao;

  ProductData productData;

  CartProduct();
  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.documentID;
    categoria = document.data["categoria"];
    pid = document.data["pid"];
    quantidade = document.data["quantidade"];
    variacao = document.data["variacao"];
  }

  Map<String, dynamic> toMap() {
    return {
      "categoria": categoria,
      "pid": pid,
      "quantidade": quantidade,
      "variacao": variacao,
//      "product": productData.toResumedMap(),
    };
  }
}
