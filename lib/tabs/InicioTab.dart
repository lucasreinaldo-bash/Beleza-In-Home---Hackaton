import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InicioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 255, 190),
            Color.fromARGB(255, 180, 255, 255)
          ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        );
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("Novidades"),
              centerTitle: true,
              elevation: 100,
              backgroundColor: Colors.transparent,
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("home")
                  .orderBy("pos")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return SliverToBoxAdapter(
                      child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ));
                else
                  (print(snapshot.data.documents.length));
                return SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: LinearProgressIndicator(),
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }
}

//Center(
//child: Image.asset(
//'assets/logonova.png',
//width: 200,
//height: 200,
//))Logo Marca
