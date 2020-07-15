import 'package:custom_project/models/news_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget{
  final NewsDetails details;
  NewScreen(this.details);
  
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(children: <Widget>[
        SafeArea(child: Text(details.description))
      ],)
    );
  }
}