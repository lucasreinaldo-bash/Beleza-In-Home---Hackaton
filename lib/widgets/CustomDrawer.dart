import 'package:compreai/tabs/InicioTab.dart';
import 'package:compreai/tiles/drawer_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 255, 190),
            Color.fromARGB(255, 180, 255, 255)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        );
    return Drawer(
        child: Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.only(left: 32, top: 16),
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/logonova.png',
                width: 150,
                height: 150,
              ),
            ),
            Divider(
              color: Colors.black45,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 16, 8),
              height: 80,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Seja bem-vindo(a)!",
                          style: TextStyle(fontSize: 20, fontFamily: "Georgia"),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("funcionando");
                          },
                          child: Text(
                            "Entre ou cadastre-se",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Georgia",
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            DrawerTile(Icons.home, "Início", pageController, 1),
            DrawerTile(Icons.list, "Produtos", pageController, 1),
          ],
        )
      ],
    ));
  }
}
