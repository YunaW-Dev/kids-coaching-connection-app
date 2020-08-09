//import 'package:flutter/material.dart';
//
//import 'package:url_launcher/url_launcher.dart';
//
//class HyperLink extends StatelessWidget{
//  final String _url;
//  final String _text;
//
//  HyperLink(this._url, this._text);
//
//  _launchURL()async{
//    if (await canLaunch(_url)){
//      await launch(_url);
//    }else{
//      throw 'error launching url';
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return InkWell(
//      child: Text(
//        _text,
//        style: TextStyle(decoration: TextDecoration.underline),
//      ),
//      onTap: _launchURL,
//    );
//
//  }
//}