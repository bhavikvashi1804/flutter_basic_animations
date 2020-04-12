import 'package:flutter/material.dart';

class BrickPage extends StatefulWidget {
  @override
  _BrickPageState createState() => _BrickPageState();
}

class _BrickPageState extends State<BrickPage> {
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