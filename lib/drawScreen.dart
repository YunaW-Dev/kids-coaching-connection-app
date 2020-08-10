import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'data.dart';
import 'coloringBookRenderer.dart';



class Draw extends StatefulWidget {

//  final Art art;

  @override
  _DrawState createState() => _DrawState();
}


class _DrawState extends State<Draw> {


  Color selectedColor = Colors.black;
  Color pickerColor = Colors.black;
  double strokeWidth = 3.0;
  List<DrawingPoints> points = List();
  bool showBottomList = false;
  double opacity = 0.1;
  StrokeCap strokeCap = (Platform.isAndroid) ? StrokeCap.round : StrokeCap.square;
  SelectedMode selectedMode = SelectedMode.StrokeWidth;
  List<Color> colors = [
    Colors.amberAccent,
    Colors.green,
    Colors.lightBlueAccent,
    Colors.pinkAccent,
    Colors.white30
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _bodyWidget(),
          _buildDrawingBoard(),
        ],
      ),
    );
  }
//    _buildDrawingBoard();}



  Widget _buildDrawingBoard(){
      return Scaffold(

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              padding: const EdgeInsets.only(left: 6.0, right: 6.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33.0),
                  color: Colors.yellowAccent),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.album),
                            onPressed: () {
                              setState(() {
                                if (selectedMode == SelectedMode.StrokeWidth)
                                  showBottomList = !showBottomList;
                                selectedMode = SelectedMode.StrokeWidth;
                              });
                              Fluttertoast.showToast(msg: "Brush Size",
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.white30,
                                textColor: Colors.white,);
                            }),
                        IconButton(
                            icon: Icon(Icons.opacity),
                            onPressed: () {
                              setState(() {
                                if (selectedMode == SelectedMode.Opacity)
                                  showBottomList = !showBottomList;
                                selectedMode = SelectedMode.Opacity;
                              });
                              Fluttertoast.showToast(msg: "Opacity",
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.white30,
                                textColor: Colors.white,);
                            }),
                        IconButton(
                            icon: Icon(Icons.color_lens),
                            onPressed: () {
                              setState(() {
                                if (selectedMode == SelectedMode.Color)
                                  showBottomList = !showBottomList;
                                selectedMode = SelectedMode.Color;
                              });
                              Fluttertoast.showToast(msg: "Colors",
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.white30,
                                textColor: Colors.white,);
                            }),
                        IconButton(
                          icon: Icon(Icons.save_alt),
                          onPressed: (){
                            Navigator.pop(context);
                          },


                        ),
                        IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                showBottomList = false;
//                              points.clear();
                              });
                            }),
                      ],
                    ),
                    Visibility(
                      child: (selectedMode == SelectedMode.Color)
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: getColorList(),
                      )
                          : Slider(
                          value: (selectedMode == SelectedMode.StrokeWidth)
                              ? strokeWidth
                              : opacity,
                          max: (selectedMode == SelectedMode.StrokeWidth)
                              ? 50.0
                              : 1.0,
                          min: 0.0,
                          onChanged: (val) {
                            setState(() {
                              if (selectedMode == SelectedMode.StrokeWidth)
                                strokeWidth = val;
                              else
                                opacity = val;
                            });
                          }),
                      visible: showBottomList,
                    ),
                  ],
                ),
              )),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[

              Container(
//                color: Colors.grey.withOpacity(0.1),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
//                      'images/${art.title}-Middle.png'
                          'images/I AM Curious-Draw.png'
                    ),
                  )
                ),

              ),
              GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    RenderBox renderBox = context.findRenderObject();
                    points.add(DrawingPoints(
                        points: renderBox.globalToLocal(details.globalPosition),
                        paint: Paint()
                          ..strokeCap = strokeCap
                          ..isAntiAlias = true
                          ..color = selectedColor.withOpacity(opacity)
                          ..strokeWidth = strokeWidth
                    ));
                  });
                },
                onPanStart: (details) {
                  setState(() {
                    RenderBox renderBox = context.findRenderObject();
                    points.add(DrawingPoints(
                        points: renderBox.globalToLocal(details.globalPosition),
                        paint: Paint()
                          ..strokeCap = strokeCap
                          ..isAntiAlias = true
                          ..color = selectedColor.withOpacity(opacity)
                          ..strokeWidth = strokeWidth));
                  });
                },
                onPanEnd: (details) {
                  setState(() {
                    points.add(null);
                  });
                },
                child: CustomPaint(
                  size: Size.infinite,
                  painter: DrawingPainter(
                    pointsList: points,
                  ),
                ),
//            child: Container(
//              height: MediaQuery.of(context).size.height,
//              width: MediaQuery.of(context).size.width,
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage(
//                      'images/I AM Curious-Draw.png'),
//                  fit: BoxFit.fill,
//                ),
//              ),
//            ),

              ),


            ],
          ),
        ),
      );

  }



  //outside of main widget build
  getColorList() {
    List<Widget> listWidget = List();
    for (Color color in colors) {
      listWidget.add(colorCircle(color));
    }
    Widget colorPicker = GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          child: AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: (color) {
                  pickerColor = color;
                },
                pickerAreaHeightPercent: 0.6,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Save!'),
                onPressed: () {
                  setState(() => selectedColor = pickerColor);
                  Navigator.of(context).pop();
                  Fluttertoast.showToast(msg: "Your Color is Ready!",
                    gravity: ToastGravity.CENTER,
                    backgroundColor: pickerColor,
                    textColor: Colors.white,
                  );
                  colors[4] = pickerColor;

                },
              ),
            ],
          ),
        );
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16.0),
          height: 36,
          width: 36,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.black, Colors.white, Colors.black,Colors.white, Colors.black,Colors.white, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
      ),
    );
    listWidget.add(colorPicker);
    return listWidget;
  }

  Widget colorCircle(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16.0),
          height: 36,
          width: 36,
          color: color,
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter({this.pointsList});
  List<DrawingPoints> pointsList;
  List<Offset> offsetPoints = List();
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
            pointsList[i].paint);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i].points);
        offsetPoints.add(Offset(
            pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));
        canvas.drawPoints(PointMode.points, offsetPoints, pointsList[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}

class DrawingPoints {
  Paint paint;
  Offset points;
  DrawingPoints({this.points, this.paint});
}

enum SelectedMode { StrokeWidth, Opacity, Color }



Widget _bodyWidget(){
  return Scaffold(
    body: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/Others/kidcloud.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}


//Widget StackWidget(){
//  return Scaffold(
//    body: Stack(
//      children: <Widget>[
//        _bodyWidget(),
//        _
//
//      ],
//    ),
//  );
//
//}
