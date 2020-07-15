import 'package:custom_project/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        FlatButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isSignedIn', false);
          NavigationService().navigateTo('login');
        },
        child: Container(
          margin: EdgeInsets.only(top: 30),
          height: 45,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorDark,
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Center(
            child: Text(
              'Logout',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      ],)
    );
  }
}
