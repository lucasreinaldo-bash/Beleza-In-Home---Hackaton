import 'package:flutter/material.dart';
import 'TelaInicial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaInicial(),
      debugShowCheckedModeBanner: true,
      title: "Compreaí Delivery",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 4, 125, 141)),
    );
  }
}
