import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:async';

//void main() => runApp(AnimatedSlide());

class AnimatedSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
          appBar: AppBar(title: Text("Drug Medicine"), backgroundColor: Color(0xFFAE1438),),
            backgroundColor: Colors.white,
            body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: height / 3,
                  width: width,
                  child: SizedBox(
                      height: 150.0,
                      width: 300.0,
                      child: Carousel(
                        images: [
                          // NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),

                          ExactAssetImage("images/1a.jpg"),
                          ExactAssetImage("images/2.jpg"),
                          ExactAssetImage("images/3.jpg"),
                          ExactAssetImage("images/8.jpg")
                        ],
                      )),
                ),
                Container(
                  height: height / 3,
                  width: width,
                  child: Header(),
                ),
                Container(
                  height: height / 3,
                  width: width,
                  child: FirestoreSlideshow(),
                ),
                Container(
                  height: height / 3,
                  width: width,
                  child: FirestoreSlideshow(),
                )
              ],
            ),
          ),
        )));
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            height: 20,
            width: width,
            child: Center(
                child: Text(
              "DRUG INTERNATIONAL LIMITED",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            )),
          ),
          Container(
            height: 15,
            width: width,
            margin: const EdgeInsets.only(top: 5.0),
            child: Center(
                child: Text(
              "Better Life Through Better Medicine",
              style: TextStyle(
                  fontSize: 15, fontStyle: FontStyle.italic, color: Colors.red),
            )),
          ),
          Container(
            height: 180,
            width: width,
            margin: const EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0),
            child: Center(
                child: Text(
              "Drug International Limited was incorporated under the Registrar of Joint Stock Companies in 1974 as a Private Limited Company. The company commenced formulation and production in 1983 and emerged as a pioneer in Bangladesh for adding a state of the art oral solid dosage plant. Since inception, Drug International Limited's primary objective has been to meet guidelines provided by major global regulatory bodies such as the World Health Organization Good Manufacturing Practices (WHO cGMP) guidelines.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            ),
          )
        ],
      )),
    );
  }
}

class FirestoreSlideshow extends StatefulWidget {
  createState() => FirestoreSlideshowState();
}

class FirestoreSlideshowState extends State<FirestoreSlideshow> {
  final PageController ctrl = PageController(viewportFraction: 0.8);

  // final Firestore db = Firestore.instance;
  Stream slides;
  String activeTag = 'favorites';
  // Keep track of current page to avoid unnecessary renders
  int currentPage = 0;

  @override
  void initState() {
    _queryDb();

    // Set state when page changes
    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: slides,
        initialData: [],
        builder: (context, AsyncSnapshot snap) {
          //List slideList = snap.data.toList();
          List<ImgData> slideList = [];
          slideList
              .add(ImgData('first', "https://via.placeholder.com/600/92c952"));
          slideList
              .add(ImgData('Second', "https://via.placeholder.com/600/771796"));
          slideList
              .add(ImgData('Thired', "https://via.placeholder.com/600/24f355"));

          return PageView.builder(
              controller: ctrl,
              itemCount: slideList.length + 1,
              itemBuilder: (context, int currentIdx) {
                if (slideList.length > currentIdx) {
                  // Active page
                  bool active = currentIdx == currentPage;
                  return _buildStoryPage(slideList[currentIdx], active);
                }
              });
        });
  }

  Stream _queryDb({String tag = 'favorites'}) {
    // Update the active tag
    setState(() {
      activeTag = tag;
    });
  }
  // Builder Functions

  _buildStoryPage(ImgData data, bool active) {
    // Animated Properties
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 10 : 30;

    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: top, bottom: 40, right: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(data.img),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black87,
                  blurRadius: blur,
                  offset: Offset(offset, offset))
            ]),
        child: Center(
            child: Text(data.title,
                style: TextStyle(fontSize: 40, color: Colors.white))));
  }
}

class ImgData {
  String title;
  String img;

  ImgData(this.title, this.img);
}
