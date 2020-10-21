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
    ])
    )
    );
  }
}

/*
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
Container( //inspired from boggle
width: 300,
height: 50,
child:RaisedButton(child: Text("Buy an item"), color: Colors.deepOrangeAccent, textColor: Colors.white, onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => BuyItemPage()),);}),
),
SizedBox(height:20),
Container(
width: 300,
height: 50,
child:RaisedButton(child: Text("Sell an item"), color: Colors.deepOrangeAccent, textColor: Colors.white, onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => SellItemPage()),);}),
)
],
),



child: Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          title: Text("Buy an Item"),
          backgroundColor: Colors.orange[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text("Logout"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              //onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: UserList(),
      ),




 */

