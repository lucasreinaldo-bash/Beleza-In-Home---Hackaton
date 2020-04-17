import 'package:compreai/routers/Login.dart';
import 'package:compreai/utils/animation_item.dart';
import 'package:compreai/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  final PageController pageController;
  final Color buttonColor;

  const FirstPage({Key key, this.pageController, this.buttonColor})
      : super(key: key);
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<AnimationItem> animationlist = [];
  double _scaleHolder = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TweenAnimationBuilder(
              duration: Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              tween: findAnimation('padding_top_label', 20, animationlist),
              builder: (context, value, child) {
                return Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: Image.asset(
                          'assets/belezainhome.png',
                          width: 200,
                          height: 200,
                        )),
                    Image.asset(
                      'assets/fundo.png',
                      width: 250,
                      height: 250,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    OutlineButton(
                      hoverColor: Colors.white,
                      highlightColor: Colors.white70,
                      highlightElevation: 10,
                      child: Text('Quero Comprar'),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Colors
                                  .red)), // callback when button is clicked
                      borderSide: BorderSide(
                        color: Colors.red, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 0.8, //width of the border
                      ),
                    ),
                    OutlineButton(
                      hoverColor: Colors.white,
                      highlightColor: Colors.white70,
                      highlightElevation: 10,
                      child: Text('Quero Vender  '),
                      onPressed: () {
                        widget.pageController.animateToPage(1,
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInCubic);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Colors
                                  .red)), // callback when button is clicked
                      borderSide: BorderSide(
                        color: Colors.red, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 0.8, //width of the border
                      ),
                    ),
                    TweenAnimationBuilder(
                      child: LogoWidget(),
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.elasticOut,
                      tween: _scaleHolder == 0.0
                          ? findAnimation('button_scale', 0.0, animationlist)
                          : Tween(begin: 0.9, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(0, 10),
                                            blurRadius: 15),
                                      ],
                                    ),
                                    height: _height * 0.075,
                                    child: RaisedButton(
                                      onHighlightChanged: (press) {
                                        setState(() {
                                          if (press) {
                                            _scaleHolder = 0.1;
                                          } else {
                                            _scaleHolder = 0.0;
                                          }
                                        });
                                      },
                                      hoverColor: Colors.lightGreen,
                                      hoverElevation: 0,
                                      highlightColor: Colors.lightGreen,
                                      highlightElevation: 0,
                                      elevation: 0,
                                      color: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      onPressed: () {
                                        widget.pageController.animateToPage(1,
                                            duration:
                                                Duration(milliseconds: 800),
                                            curve: Curves.easeInCubic);
                                      },
                                      child: Text(
                                        'Sou uma empresa e quero vender',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
