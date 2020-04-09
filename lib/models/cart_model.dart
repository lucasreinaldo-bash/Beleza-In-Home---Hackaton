import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/datas/cart_product.dart';
import 'package:compreai/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  //Cupom de desconto
  String cupomDesconto;
  int discountPercentage = 0;

  UserModel user;
  List<CartProduct> products = [];

  bool isLoading = false;
  CartModel(this.user) {
    if (user.isLoggedIn()) _loadCartItens();
  }

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);
  void addCartItem(CartProduct cartProduct) {
    products.add(cartProduct);

    Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .add(cartProduct.toMap())
        .then((doc) {
      cartProduct.cid = doc.documentID;
    });

    notifyListeners();
  }

  void removeCartItem(CartProduct cartProduct) {
    Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cid)
        .delete();

    products.remove(cartProduct);

    notifyListeners();
  }

  void decProduct(CartProduct cartProduct) {
    cartProduct.quantidade--;

    Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }

  void incProduct(CartProduct cartProduct) {
    cartProduct.quantidade++;

    Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }

  void _loadCartItens() async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("Usuarios")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .getDocuments();

    products = querySnapshot.documents
        .map((doc) => CartProduct.fromDocument(doc))
        .toList();
    notifyListeners();
  }

  void setCupon(String cupomCodigo, int descontoPorcentagem) {
    this.cupomDesconto = cupomCodigo;
    this.discountPercentage = descontoPorcentagem;
  }

  double getProductPrice() {
    double price = 0.0;
    for (CartProduct c in products) {
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
}
