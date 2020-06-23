import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutterbottomnav/AnimatedSlide.dart';
import './pre/my_flutter_app_icons.dart' as ci;

import 'A.dart';
import 'B.dart';
import 'C.dart';
//import 'MyAppp.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false ,home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<MyApp>{
  var page = 0;
  final pages = [A(), B() , C(), AnimatedSlide()/*, AllCountries()*/];
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          color: Color(0xFFAE1438),
          buttonBackgroundColor: Colors.lightGreenAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(microseconds: 600),
          onTap: (index){
           setState(() {
             page = index;
           });
          },
          items: [
        Icon(ci.MyFlutterApp.pharmacy),
        Icon(Icons.add_circle),
        Icon(Icons.add_a_photo),
        Icon(Icons.add_a_photo),
      ]) ,
      body: pages[page],
    );
  }
}



