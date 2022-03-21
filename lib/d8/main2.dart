
import 'package:flutter/material.dart';

void main() => runApp(Animation1());


class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  MyColorTween tween;
  // ColorTween tween;

  Animation<Color> colorAnimation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: Container(
          width: 100+animationController.value*200,
          height: 100+animationController.value*200,
          // width: 100,
          // height: 100,
          color: colorAnimation.value,
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
        duration: Duration(seconds: 10),
        vsync: this);

    animationController.addListener(() {
      setState(() {

      });
      print(animationController.value);
    });

    // tween = Tween(begin: Colors.red, end: Colors.yellow);//用父类，没有实现变化方法，所以报错
    tween = MyColorTween(begin: Colors.red, end: Colors.yellow);//自定义 且 重写了变化方法，其实就是实现了ColorTween
    // tween = ColorTween(begin: Colors.red, end: Colors.yellow);
    colorAnimation = tween.animate(animationController);

    animationController.forward();
  }
}

class MyColorTween extends Tween<Color>{

  MyColorTween({ Color begin, Color end}):super(begin: begin, end: end);

  //TODO 要重写变化方法
  @override
  Color lerp(double t) {
    // return super.lerp(t);
    return Color.lerp(begin, end, t);
  }
}
