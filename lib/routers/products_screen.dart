import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/datas/product_data.dart';
import 'package:compreai/tiles/product_tile.dart';
import 'package:flutter/material.dart';

class Products_Screen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  Products_Screen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data["title"]),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.purple,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.list)),
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("produtos")
                .document(snapshot.documentID)
                .collection("itens")
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    GridView.builder(
                        padding: EdgeInsets.all(5),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.65),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              "grid",
                              ProductData.fromDocument(
                                  snapshot.data.documents[index]));
                        }),
                    ListView.builder(
                        padding: EdgeInsets.all(4),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              "list",
                              ProductData.fromDocument(
                                  snapshot.data.documents[index]));
                        })
                  ],
                );
            },
          )),
    );
  }
}
