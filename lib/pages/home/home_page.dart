import 'package:hendrix_marketplace/pages/home/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/services/auth.dart';


class HomePage extends StatefulWidget{
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  final loginService _auth = loginService();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        actions: <Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white10,
        padding: const EdgeInsets.all(80.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: "HomePageThing1",
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


