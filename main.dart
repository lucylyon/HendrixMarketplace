import 'package:firebase_core/firebase_core.dart';
import 'package:hendrix_marketplace/pages/authentication/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/widgets/misc.dart';




void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot){
          //Check for errors
          if(snapshot.hasError){
            return null;
          }
          //if it completes show the app
          if(snapshot.connectionState == ConnectionState.done){
            return new MaterialApp(
              title: "Ticket Manager App",
              theme: ThemeData(
                primarySwatch: Colors.grey,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Authenticate(),
            );
          }
          return LoadingWidget();
        }

    );
    // https://stackoverflow.com/questions/63492211/no-firebase-app-default-has-been-created-call-firebase-initializeapp-in
  }



}


// https://www.youtube.com/watch?v=LBJoY4VjECo&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=5
// https://api.flutter.dev/flutter/material/Colors/orange-constant.html
// https://api.flutter.dev/flutter/material/RaisedButton-class.html
