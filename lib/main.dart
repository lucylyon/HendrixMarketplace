import 'dart:ui';
import 'package:hendrix_marketplace/pages/authentication/register.dart';
import 'package:hendrix_marketplace/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hendrix_marketplace/pages/home/bottom_nav_page.dart';
import 'package:provider/provider.dart';
import 'package:hendrix_marketplace/models/user.dart';
import 'package:hendrix_marketplace/wrapper.dart';

import 'package:hendrix_marketplace/pages/home/profile_page.dart';
import 'pages/home/edit_profile_page.dart';
import 'pages/home/home_page.dart';



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  /*
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Hendrix Marketplace",
      theme: ThemeData(
          primaryColor: Colors.blueGrey,
          accentColor: Colors.orange
      ),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/EditProfilePage": (BuildContext context) => new EditProfilePage(),
        "/ProfilePage":(BuildContext context) => new ProfilePage(),
        "/HomePage" :(BuildContext context) => new HomePage()
      },
    );
  }
   */

  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: loginService().user,
      child: MaterialApp(
        //The home page goes to wrapper
          home: Wrapper(),
        routes: <String, WidgetBuilder>{
          "/EditProfilePage": (BuildContext context) => new EditProfilePage(),
          "/Register": (BuildContext context) => new Register(),
          "/ProfilePage":(BuildContext context) => new ProfilePage(),
          "/HomePage" :(BuildContext context) => new HomePage()
        },
      ),
    );
  }
}


// https://www.youtube.com/watch?v=LBJoY4VjECo&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=5
// https://api.flutter.dev/flutter/material/Colors/orange-constant.html
// https://api.flutter.dev/flutter/material/RaisedButton-class.html
