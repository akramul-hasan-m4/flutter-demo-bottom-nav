import 'package:flutter/material.dart';
//Custom Alert Dialog
class C extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RaisedButton(child: Text("Click ME"),onPressed: (){
          showDialog(context: context,
          builder: (context){
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          new Text(
                            "Alert Dialog",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB83227)
                            ),
                          ) ,
                          SizedBox(
                            height: 20,
                          ),
                          new Text(
                            "Alert Dialog msg Alert Dialog msg Alert Dialog msg ",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xffB83227)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                    radius: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Image.asset("images/drug.jpg")
                      )
                  ),)
                ],

              ),
            );
          });
        }),
      ),
    );
  }
}