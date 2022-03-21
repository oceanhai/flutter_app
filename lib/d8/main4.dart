
import 'package:flutter/material.dart';

void main() => runApp(Animation1());


class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  bool isForward = true;

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
          // width: 100,
          // height: 100,
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
        duration: Duration(seconds: 3),
        vsync: this);

    animationController.addListener(() {
      setState(() {

      });
      // print(animationController.value);
    });

    animationController.addStatusListener((status) {
      print(status);
      if(status == AnimationStatus.completed){
        if(isForward){
          isForward = false;
          animationController.reverse();
        }else{
          //TODO 正向启动 未启动，也就是不能无限执行
          isForward = true;
          animationController.forward();
        }
      }
    });

    animationController.forward();
  }
}
