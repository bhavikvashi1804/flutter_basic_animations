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
    _animation=Tween<double>(begin: -1.0,end: 0.0).animate(
      CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: _animationController
      )
    )..addStatusListener(myListener);

   

    _animationController.forward();


    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  void myListener(status){

    if(status==AnimationStatus.completed){
      _animationController.reset();
      _animation=Tween<double>(begin: 0.0,end: 1.0).animate(
        CurvedAnimation(
          curve: Curves.fastOutSlowIn,
          parent: _animationController
        )
      );
      _animationController.forward();
    }


  }

  

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
      
        title: Text('Flutter Basic Animations'),
      ),
      body: AnimatedBuilder(
        
        animation: _animationController,
        builder: (context, child) =>Transform(
          transform: Matrix4.translationValues(_animation.value*width, 0.0, 0.0),
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.deepOrangeAccent,
            )
          ),
        ),
      )
    );
  }
}

