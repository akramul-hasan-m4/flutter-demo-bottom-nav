import 'package:flutter/material.dart';

class B extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("B", style: TextStyle(fontSize: 30, color: Colors.white),),
      ),
    );
  }
}