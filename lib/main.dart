import 'package:flutter/material.dart';

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


  Animation<Color> _animation;
  AnimationController _animationController;
  
  
  


  @override
  void initState() {
    _animationController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _animation=ColorTween(begin: Colors.yellow,end: Colors.cyan).animate(_animationController);

    _animationController.forward();

    _animation.addListener(() { 
      setState(() {
        
      });
    });
   


    super.initState();
  }



  

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
      
        title: Text('Flutter Basic Animations'),
      ),
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          color: _animation.value,
          child: FlutterLogo(),
        ),
      )
    );
  }
}
