import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlipperPage extends StatefulWidget {
  @override
  _FlipperPageState createState() => _FlipperPageState();
}

class _FlipperPageState extends State<FlipperPage>
    with SingleTickerProviderStateMixin {
  bool _reversed = false;
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 2000));

    _animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: -math.pi / 2), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: math.pi / 2, end: 0.0), weight: 0.5)
    ]).animate(_animationController);

    //we have used here TweenSeq because

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //on tap handle the forward / reverse
  _doAnim() {
    if (!mounted) return;
    if (_reversed) {
      _animationController.reverse();
      _reversed = false;
    } else {
      _animationController.forward();
      _reversed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flipper'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value),
            child: GestureDetector(
              onTap: _doAnim,
              child: IndexedStack(
                children: <Widget>[CardOne(), CardTwo()],
                alignment: Alignment.center,
                index: _animationController.value < 0.5 ? 0 : 1,
                // if val=0 then display CardOne
                //else display CardTwo
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Container(
        width: 300,
        height: 300,
        child: Center(
          child: Text(
            "Tap to see the code",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Container(
        width: 300,
        height: 300,
        child: Center(
          child: Text(
            "356789",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
            ),
          ),
        ),
      ),
    );
  }
}
