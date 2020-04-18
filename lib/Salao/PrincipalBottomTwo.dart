import 'package:compreai/Salao/cart_screenTwo.dart';
import 'package:compreai/Salao/produtosTwo.dart';
import 'package:compreai/routers/cart_screen.dart';
import 'package:compreai/routers/perfilUsuario.dart';
import 'package:compreai/routers/produtos.dart';
import 'package:compreai/widgets/AnimatedBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrincipalTwo extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Suporte Online",
      iconData: Icons.help_outline,
      color: Colors.purple,
    ),
    BarItem(
      text: "Produtos",
      iconData: Icons.add_shopping_cart,
      color: Colors.blueAccent.shade700,
    ),
    BarItem(
      text: "Meu Carrinho",
      iconData: Icons.shopping_cart,
      color: Colors.blueAccent.shade700,
    ),
    BarItem(
      text: "Meus Pedidos",
      iconData: Icons.shopping_basket,
      color: Colors.lightBlue.shade900,
    ),
    BarItem(
      text: "Meu Perfil",
      iconData: Icons.perm_identity,
      color: Colors.lightBlue.shade900,
    ),

    /*BarItem(
      text: "Search",
      iconData: Icons.search,
      color: Colors.yellow.shade900,
    ),
    */
  ];
  @override
  _PrincipalTwoState createState() => _PrincipalTwoState();
}

class _PrincipalTwoState extends State<PrincipalTwo> {
  int selectedBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //systemNavigationBarColor: Colors.lightBlue[700], // navigation bar color
        //statusBarColor: Colors.lightBlue[700],
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.deepPurpleAccent,
        statusBarIconBrightness: Brightness.dark // status bar color
        ));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    List<Widget> telas = [
      ProdutosTwo(),
      ProdutosTwo(),
      CartScreen(),
      PerfilUsuario(),
      PerfilUsuario(),
    ];

    return Scaffold(
      body: telas[selectedBarIndex],
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
        animationDuration: const Duration(milliseconds: 500),
        barStyle: BarStyle(fontSize: width * 0.024, iconSize: width * 0.05),
        onBarTap: (index) {
          setState(() {
            selectedBarIndex = index;
          });
        },
      ),
    );
  }
}
