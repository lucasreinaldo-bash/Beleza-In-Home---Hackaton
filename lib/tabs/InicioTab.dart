import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

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
              floating: true,
              title: Text("Novidades"),
              centerTitle: true,
              elevation: 100,
              backgroundColor: Colors.green,
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
                else {
                  (print(snapshot.data.documents.length));
                  return SliverStaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      staggeredTiles: snapshot.data.documents.map((doc) {
                        return StaggeredTile.count(
                            doc.data["x"], doc.data["y"]);
                      }).toList(),
                      children: snapshot.data.documents.map((doc) {
                        return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: doc.data["image"],
                          fit: BoxFit.cover,
                        );
                      }).toList());
                }
              },
            )
          ],
        ),
        Center(
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
//              child: Image.asset(
//                'assets/logonova.png',
//                width: 200,
//                height: 200,
//              ),
            ),
          ),
        )
      ],
    );
  }
}
