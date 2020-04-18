import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/tiles/categories.dart';
import 'package:flutter/material.dart';

import 'categoriesTwo.dart';

class ProductTabTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance
          .collection("hackaton")
          .orderBy("pos")
          .getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.white,
                  Colors.white10,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              ListView(
                  children: snapshot.data.documents.map((doc) {
                return CategoryTileTwo(doc);
              }).toList())
            ],
          );
        }
      },
    );
  }
}
