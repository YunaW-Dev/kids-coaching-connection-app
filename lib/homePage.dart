import 'dart:ui';
import 'data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coloringBookList.dart';
import 'drawScreen.dart';
import 'styles.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';




//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////      appBar: AppBar(
////        title: Text('Magnifest Your Magnificence'),
////      ),
//      backgroundColor: Colors.yellowAccent,
//      body: Center(
//        child: RaisedButton(
//          child: Text("Let's Start Painting!"),
//          onPressed: () {
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context)=>Draw()));
//          },
//        ),
//      ),
//    );
//  }
//}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Art> _artList;
  Art _currentArt;

  @override
  void initState() {
    super.initState();
    var data = ArtData();
    _artList = data.getArts();
    _currentArt = _artList[1];
  }

  @override
  Widget build(BuildContext context) {
    var width1 = MediaQuery.of(context).size.width;
    var height1 = MediaQuery.of(context).size.height;
    return Scaffold(
//      appBar: _buildAppBar(),
        body: Container(
//          color: Color(0xfffbf7f5),
// //     color: Color(0xfffff4e6),
// //     color: Color(0xffffe4e1),
          height: height1,
          width: width1,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/Others/kidcloud.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox()),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
                child: Text(
                  'Manifest Your Magnificence!',
                  overflow: TextOverflow.ellipsis,
                  style: Styles.appHeader,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox()),

              ColoringBookList(
                arts: _artList,
                onArtChange: _handleArtChange,
              ),
//            HotelList(_currentCity.hotels),
//            Expanded(child: SizedBox()),

//            RaisedButton(

////              color: Colors.white,
////
//////              child: Text('Coloring Now!',
//////                style: TextStyle(
//////                  fontWeight: FontWeight.bold,
//////                  color: Colors.black
//////                ),),
////            child: Container(
////              decoration: const BoxDecoration(
////                gradient: LinearGradient(
////                  colors: <Color>[
////                    Colors.orange,Colors.yellowAccent,Colors.green,Colors.teal,Colors.blue,Colors.deepPurpleAccent
////                  ]
////                )
////              )
////            ),
//              onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context)=>Draw()));
//              }
////
////            )
//            RaisedButton(
//              onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context)=>Draw()));
//              },
//              padding: const EdgeInsets.all(0.0),
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(20)
//              ),
//              textColor: Colors.white,
//              child: Container(
//                decoration: const BoxDecoration(
//                  gradient: LinearGradient(
//                    colors: <Color>[
//                    Colors.orange,Colors.yellowAccent,Colors.green,Colors.teal,Colors.blue,Colors.deepPurpleAccent
//
//                    ],
//                  ),
//                ),
//                padding: const EdgeInsets.all(6.0),
//                child: const Text(
//                    'START HERE',
//                    style: TextStyle(fontSize: 16)
//                ),
//
//              ),
//            ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Draw()));
                },
                child: Container(
                  width: 160,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff8b5a2b),Color(0xffffa54f),Color(0xffa0522d),Color(0xffcd8500),Color(0xff8b4513),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(3, 3),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Start Coloring!',
                      style: TextStyle(
                        color: Color(0xfffbf7f5),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),

            ],
          ),
        ),
      );
  }





  void _handleArtChange(Art art) {
    setState(() {
      this._currentArt = art;
    });
  }



  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: Icon(Icons.menu, color: Colors.black),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
          child: Icon(Icons.search, color: Colors.black),
        )
      ],
    );
  }
}
