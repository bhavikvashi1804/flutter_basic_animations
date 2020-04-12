import 'package:flutter/material.dart';

class BrickPage extends StatefulWidget {
  @override
  _BrickPageState createState() => _BrickPageState();
}

class _BrickPageState extends State<BrickPage> with TickerProviderStateMixin{

  AnimationController _animationController;
  Tween _tween;

  @override
  void initState() {
   
    _animationController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 20)
    );

    _tween=Tween(begin: 0.0,end: 1.0);

    super.initState();
  }

  @override
  void dispose() { 
    _animationController.dispose();
    super.dispose();
  }

  //for B1
  Animation get animOne=>_tween.animate(
    CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.0, 0.125,curve: Curves.linear),
    )
  );
  //for B1
  Animation get animTwo=>_tween.animate(
    CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.125, 0.250,curve: Curves.linear),
    )
  );

  //for B2
  Animation get animThree=>_tween.animate(
    CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.250, 0.375,curve: Curves.linear),
    )
  );
  //for B3
   Animation get animFour=>_tween.animate(
    CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.375, 0.5,curve: Curves.linear),
    )
  );

  //for B4
  Animation get animFive=>_tween.animate(
    CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.5, 0.625,curve: Curves.linear),
    )
  );
  //for B4
  Animation get animSix=>_tween.animate(
    CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.625, 0.750,curve: Curves.linear),
    )
  );

  //for B3
  Animation get animSeven=>_tween.animate(
    CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.750, 0.875,curve: Curves.linear),
    )
  );

  //for B2
  Animation get animEight=>_tween.animate(
    CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.875, 1.0,curve: Curves.linear),
    )
  );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brick Animation'),
      ),
      
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Brick(),
            Brick(),
            Brick(),
            Brick(),
          ],
        )
      ),
    );
  }
}

class Brick extends StatelessWidget {
  
  final double leftMargin;
  Brick({this.leftMargin=15.0});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 40,
      margin: EdgeInsets.only(left: leftMargin),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15.0)
      ),
      
    );
  }
}