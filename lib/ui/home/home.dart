import 'package:custom_project/services/navigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      InkWell(
          child: Icon(Icons.account_circle, size: 100.0),
          onTap: () {
            NavigationService().navigate('profile');
          }),
      InkWell(
          child: Icon(Icons.new_releases, size: 100.0),
          onTap: () {
            NavigationService().navigate('news');
          }),
      InkWell(
          child: Icon(Icons.code, size: 100.0),
          onTap: () {
            NavigationService().navigate('qr');
          }),
      InkWell(
          child: Icon(Icons.photo_camera, size: 100.0),
          onTap: () {
            NavigationService().navigate('photo');
          }),
    ]);
  }

  @override
  void initState() {
    super.initState();
  }
}
