
import 'package:flutter/material.dart';

void main() => runApp(Animation1());


class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  MyValueTween tween;

  Animation<MyValue> animation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: Container(
          width: animation.value.value,
          height: animation.value.value,
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
        duration: Duration(seconds: 10),
        vsync: this);

    animationController.addListener(() {
      setState(() {

      });
      print(animationController.value);
    });

    tween = MyValueTween(begin: MyValue(100), end: MyValue(50));
    animation = tween.animate(animationController);

    animationController.forward();
  }
}

class MyValue{
  double value;

  MyValue(this.value);

}

//自定义 一个tween  起始值-结束值
class MyValueTween extends Tween<MyValue>{

  MyValueTween({ MyValue begin, MyValue end }) : super(begin: begin, end: end);

  @override
  MyValue lerp(double t) {//100-》50 进行缩小
    return MyValue(begin.value+t*(end.value-begin.value));
  }
}