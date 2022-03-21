
import 'package:flutter/material.dart';

void main() => runApp(Animation1());


class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: Container(
          width: animationController.value,
          height: animationController.value,
          color: Colors.red,
          child: Text("11111"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
        lowerBound: 100,
        upperBound: 300,
        duration: Duration(seconds: 10),
        vsync: this);

    animationController.addListener(() {
      setState(() {

      });
      print(animationController.value);
    });
    animationController.forward();
  }
}
