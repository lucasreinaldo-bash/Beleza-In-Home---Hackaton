import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String id;
  String category;
  String title;
  String description;
  double price;
  List images;
  List variacao;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"] + 0.0;
    variacao = snapshot.data["variacao"];
    images = snapshot.data["images"];
  }
}
