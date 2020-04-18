import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/datas/cart_product.dart';
import 'package:compreai/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';

import 'cart_productTwo.dart';

class CartModelTwo extends Model {
  //Cupom de desconto
  String cupomDesconto;
  int discountPercentage = 0;

  UserModel user;
  List<CartProductTwo> products = [];

  bool isLoading = false;
  CartModelTwo(this.user) {
    if (user.isLoggedIn()) _loadCartItens();
  }

  static CartModelTwo of(BuildContext context) =>
      ScopedModel.of<CartModelTwo>(context);
  void addCartItem(CartProductTwo cartProduct) {
    products.add(cartProduct);

    Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cartTwo")
        .add(cartProduct.toMap())
        .then((doc) {
      cartProduct.cid = doc.documentID;
    });

    notifyListeners();
  }

  void removeCartItem(CartProductTwo cartProduct) {
    Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cartTwo")
        .document(cartProduct.cid)
        .delete();

    products.remove(cartProduct);

    notifyListeners();
  }

  void decProduct(CartProductTwo cartProduct) {
    cartProduct.quantidade--;

    Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cartTwo")
        .document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }

  void incProduct(CartProductTwo cartProduct) {
    cartProduct.quantidade++;

    Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cartTwo")
        .document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }

  void _loadCartItens() async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cartTwo")
        .getDocuments();

    products = querySnapshot.documents
        .map((doc) => CartProductTwo.fromDocument(doc))
        .toList();
    notifyListeners();
  }

  void setCupon(String cupomCodigo, int descontoPorcentagem) {
    this.cupomDesconto = cupomCodigo;
    this.discountPercentage = descontoPorcentagem;
  }

  double getProductPrice() {
    double price = 0.0;
    for (CartProductTwo c in products) {
      if (c.productData != null) price += c.quantidade * c.productData.price;
    }
    return price;
  }

  double getDesconto() {
    return getProductPrice() * discountPercentage / 100;
  }

  double getFrete() {
    return 7.00;
  }

  void updatePrice() {
    notifyListeners();
  }

  Future<String> finalizarCompra() async {
    if (products.length == 0) return null;

    isLoading = true;
    notifyListeners();

    double productsPrice = getProductPrice();
    double productsFrete = getFrete();
    double productsDesconto = getDesconto();

    DocumentReference referenciaOrdem =
        await Firestore.instance.collection("ordemPedidos").add({
      "clienteId": user.firebaseUser.uid,
      "produtos": products.map((catProduct) => catProduct.toMap()).toList(),
      "precoDoFrete": productsFrete,
      "precoDosProdutos": productsPrice,
      "desconto": productsDesconto,
      "precoTotal": productsPrice - productsDesconto + productsFrete,
      "status": 1
    });

    await Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("ordemPedidos")
        .document(referenciaOrdem.documentID)
        .setData({"ordemId": referenciaOrdem.documentID});

    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cartTwo")
        .getDocuments();
    for (DocumentSnapshot doc in querySnapshot.documents) {
      doc.reference.delete();
    }

    products.clear();

    cupomDesconto = null;
    discountPercentage = 0;

    isLoading = false;
    notifyListeners();

    return referenciaOrdem.documentID;
  }
}
