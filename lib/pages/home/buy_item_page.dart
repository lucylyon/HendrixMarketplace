import 'package:hendrix_marketplace/models/user.dart';
import 'package:hendrix_marketplace/pages/home/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/pages/home/user_list.dart';
import 'package:hendrix_marketplace/services/auth.dart';
import 'package:hendrix_marketplace/pages/home/edit_profile_page.dart';
import 'package:hendrix_marketplace/pages/authentication/register.dart';
import 'package:hendrix_marketplace/services/database.dart';
import 'package:provider/provider.dart';


class BuyItemPage extends StatefulWidget{
  @override
  State createState() => new BuyItemPageState();
}

class BuyItemPageState extends State<BuyItemPage> {

  final loginService _auth = loginService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>.value(
      value: DatabaseService().users,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body:    UserList(),
      ),
    );
  }
}


