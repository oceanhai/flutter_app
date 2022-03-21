
import 'package:flutter/material.dart';

void main() => runApp(Animation1());


class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  CurvedAnimation curvedAnimation;

  Animation<double> animate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: Column(
          children: [
            RaisedButton(onPressed: (){
              animationController.stop();//status AnimationStatus.reverse
              },child: Text("stop")),
            Container(
              width: animate.value,
              height: animate.value,
              // width: 100,
              // height: 100,
              color: Colors.red,
              child: Text("11111"),
            ),
          ],
        )
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
        duration: Duration(seconds: 3),
        vsync: this);

    animationController.addListener(() {
      setState(() {

      });
      // print(animationController.value);
    });

    animationController.addStatusListener((status) {
      print(status);

      //放大缩小 循环播放 TODO 视频那个还设置了开关，多此一举， 最后视频改进了
      if(status == AnimationStatus.completed){
          animationController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });

    //插值器
    curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animate = Tween(begin: 100.0,end: 300.0).animate(curvedAnimation);
    
    animationController.forward();
  }
}
