import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compreai/routers/products_screen.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
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
                  builder: (context) => Products_Screen(snapshot)));
            },
          ),
        ],
      ),
    );
  }
}
