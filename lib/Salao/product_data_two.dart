import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDataTwo {
  String id;
  String category;
  String title;
  String description;
  double price;
  List images;
  List variacao;

  ProductDataTwo.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"] + 0.0;
    variacao = snapshot.data["variacao"];
    images = snapshot.data["images"];
  }

  Map<String, dynamic> toResumedMap() {
    return {
      "title": title,
      "description": description,
      "preco": price,
    };
  }
}
