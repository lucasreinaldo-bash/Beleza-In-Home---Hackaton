import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/tiles/categories.dart';
import 'package:flutter/material.dart';

class ProductTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance
          .collection("produtos")
          .orderBy("pos")
          .getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return ListView(
              children: snapshot.data.documents.map((doc) {
            return CategoryTile(doc);
          }).toList());
        }
      },
    );
  }
}
