import 'package:custom_project/services/navigation.dart';
import 'package:custom_project/ui/components/input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  static TextEditingController _emailController = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();
  final LoginInputWidget login = LoginInputWidget(
      icon: Icon(Icons.email),
      hint: "EMAIL",
      obscure: false,
      controller: _emailController,
      isPassword: false);
  final LoginInputWidget password = LoginInputWidget(
      icon: Icon(Icons.lock),
      hint: "PASSWORD",
      obscure: true,
      controller: _passwordController,
      isPassword: true);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    showAlertDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Success"),
          content: Text("You are authorized"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('isSignedIn', true);
                NavigationService().navigate('home');
              },
            ),
          ],
        ),
      );
    }

    onLogin() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        showAlertDialog();
      }
    }

    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColorDark
                      ],
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32, right: 32),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    Container(child: login),
                    Container(child: password),
                    InkWell(
                      onTap: () {
                        onLogin();
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
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
