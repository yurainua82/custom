import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  File  imageFile;
  ImagePicker picker = ImagePicker();
  _openGallery(BuildContext context)async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }
  _openCamera(BuildContext context) async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }
  Future<void> _showChoiseDialog(BuildContext context){
    return showDialog(context: context,builder:  (BuildContext context){
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Gallery'),
                onTap: (){
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(5.0),),
              GestureDetector(
                child: Text('Camera'),
                onTap: (){
                  _openCamera(context);
                },
              ),
            ],
          )
        ),
      );
    });
  }
  Widget _decideImageView(){
    if(imageFile == null){
      return Text('No image selected');}
    else{
      return Image.file(imageFile,width:400,height: 400);
    }  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
              RaisedButton(onPressed: () {_showChoiseDialog(context);}, child: Text('Select image'))
            ],
          ),
        ),
      ),
    );
  }
}
