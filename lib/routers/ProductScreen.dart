import 'package:carousel_pro/carousel_pro.dart';
import 'package:compreai/datas/cart_product.dart';
import 'package:compreai/datas/product_data.dart';
import 'package:compreai/models/cart_model.dart';
import 'package:compreai/models/user_model.dart';
import 'package:compreai/widgets/cart_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;
  ProductScreen(this.product);
  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;
  String preferencia;
  _ProductScreenState(this.product);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Stack(
      children: <Widget>[
        Scaffold(
            floatingActionButton: CartButton(),
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                product.title,
                style: TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: ListView(
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 0.9,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Carousel(
                          images: product.images.map((url) {
                            return NetworkImage(url);
                          }).toList(),
                          dotSize: 10,
                          dotSpacing: 15,
                          dotBgColor: Colors.transparent,
                          autoplay: true,
                          dotIncreasedColor: Colors.blue,
                          dotColor: Colors.blueGrey,
                          animationDuration: Duration(seconds: 2),
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                        maxLines: 3,
                      ),
                      Text(
                        "R\$ ${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Preferência",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 40,
                        child: GridView(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 0.30),
                            children: product.variacao.map((s) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    preferencia = s;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      border: Border.all(
                                          color: s == preferencia
                                              ? Colors.green[600]
                                              : Colors.grey,
                                          width: s == preferencia ? 4 : 1)),
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(s),
                                ),
                              );
                            }).toList()),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed: preferencia != null
                              ? () {
                                  if (UserModel.of(context).isLoggedIn()) {
                                    CartProduct cartProduct = CartProduct();
                                    cartProduct.variacao = preferencia;
                                    cartProduct.quantidade = 1;
                                    cartProduct.pid = product.id;
                                    cartProduct.categoria = product.category;
                                    CartModel.of(context)
                                        .addCartItem(cartProduct);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CartScreen()));
                                  } else {
                                    _scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text("Você não está conectado!"),
                                      backgroundColor: Colors.blueGrey,
                                      duration: Duration(seconds: 2),
                                    ));
                                  }
                                }
                              : null,
                          child: Text("Adicionar ao Carrinho",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Descrição",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        product.description,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
