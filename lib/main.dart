import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{


  Animation<double> _animation;
  AnimationController _animationController;
  
  
  


  @override
  void initState() {
    _animationController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _animation=Tween<double>(begin: 0.0,end: 1.0).animate(_animationController);

    _animationController.forward();


    super.initState();
  }



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Text('Flutter Basic Animations'),
      ),
      body: Center(
        child: AnimatedLogo(animation: _animation,),
      )
    );
  }
}

class AnimatedLogo extends AnimatedWidget{

  final Tween<double> sizeAnimation=Tween<double>(begin: 20,end: 150);
  final Tween<double> rotateAnimation=Tween<double>(begin: 0,end:30);

  AnimatedLogo({
    Key key,
    Animation animation,

  }):super(
    key:key,
    listenable:animation
  );


  @override
  Widget build(BuildContext context) {
    final Animation<double> animation=listenable;
    return Opacity(
      opacity: animation.value ,
      child: Transform.rotate(
        angle: animation.value * 2.0 * math.pi, 
        child: Container(
          width: sizeAnimation.evaluate(animation),
          height: sizeAnimation.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }

}
