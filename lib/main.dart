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
    _animation=CurvedAnimation(parent: _animationController, curve: Curves.decelerate);

   

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
      child: Transform.scale(
        scale: animation.value*10, 
        child: Container(
          child: FlutterLogo(),
        ),
      ),
    );
  }

}
