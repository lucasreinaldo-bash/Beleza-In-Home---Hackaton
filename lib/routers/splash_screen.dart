import 'package:compreai/routers/start_page.dart';
import 'package:compreai/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    openStartPage();
  }

  openStartPage() async {
    await Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StartPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Transform.scale(
              scale: 1.2,
              child: Image.asset(
                'assets/belezainhome.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
