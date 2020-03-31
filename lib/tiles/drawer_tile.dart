import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  double i = 1.0;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Icon(icon, size: 32, color: Colors.black),
              SizedBox(width: 32),
              Text(
                text + "" + page.toString(),
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
