import 'package:hendrix_marketplace/models/user.dart';
import 'package:hendrix_marketplace/pages/home/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/pages/home/user_list.dart';
import 'package:hendrix_marketplace/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:hendrix_marketplace/services/database.dart';


class HomePage extends StatefulWidget{
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  final loginService _auth = loginService();

  @override
  Widget build(BuildContext context){
    return StreamProvider<List<User>>.value(
      value: DatabaseService().users,
      child: new Scaffold(
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
        body: UserList(),
      ),
    );
  }
}


