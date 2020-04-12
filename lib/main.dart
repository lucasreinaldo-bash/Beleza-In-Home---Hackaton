import 'package:compreai/PrincipalBottom.dart';
import 'package:compreai/models/cart_model.dart';
import 'package:compreai/models/user_model.dart';
import 'package:compreai/routers/Login.dart';
import 'package:compreai/routers/Registrar.dart';
import 'package:compreai/routers/cart_screen.dart';
import 'package:compreai/routers/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'TelaInicial.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black));
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child: MaterialApp(
              home: SplashScreen(),
//      home: Principal(),
              debugShowCheckedModeBanner: false,
              title: "Compreaí Delivery",
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: Color.fromARGB(255, 20, 125, 141)),
            ),
          );
        },
      ),
    );
  }
}
