import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/Salao/products_screen_two.dart';
import 'package:compreai/routers/products_screen.dart';
import 'package:flutter/material.dart';

class CategoryTileTwo extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTileTwo(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 255, 255, 190),
                  Color.fromARGB(255, 180, 255, 255)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(snapshot.data["icon"]),
                ),
                title: Text(
                  snapshot.data["title"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Products_ScreenTwo(snapshot)));
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
