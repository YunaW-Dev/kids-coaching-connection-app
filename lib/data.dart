import 'package:flutter/material.dart';

class Art{
  final String title;
  final String description;
  final Color color;


  Art({
    this.title,
    this.description,
    this.color,
});
}

class ArtData{
  List<Art> _arts = [
    Art(
      title:'I AM Magnificent',
      description: 'I AM Magnificent Drawing Card',
        color: Color(0xffffcc5c)
    ),
    Art(
        title:'I AM Positive',
        description: 'I AM Positive Drawing Card',
        color: Color(0xff96ceb4)
    ),
    Art(
        title:'I AM Curious',
        description: 'I AM Curious Drawing Card',
        color: Color(0xffdee5cf)
    ),
    Art(
        title:'I AM Conscientious',
        description: 'I AM Conscientious Drawing Card',
        color: Color(0xffffdfba)
    ),
    Art(
        title:'I AM Responsible',
        description: 'I AM Responsible Drawing Card',
        color: Color(0xff5bc0de)
    ),
    Art(
        title:'I AM Unique',
        description: 'I AM Unique Drawing Card',
        color: Color(0xffffffba)
    ),
    Art(
        title:'I AM a Champion',
        description: 'I AM a Champion Drawing Card',
        color: Color(0xfff9f1f1)
    ),
    Art(
        title:'I AM a Shining Star',
        description: 'I AM a Shining Star Drawing Card',
        color: Color(0xff96ceb4)
    ),
  ];

  List<Art> getArts() => _arts;
}