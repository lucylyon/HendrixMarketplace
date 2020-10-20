import 'package:hendrix_marketplace/pages/home/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/services/auth.dart';
import 'package:hendrix_marketplace/pages/home/edit_profile_page.dart';
import 'package:hendrix_marketplace/pages/authentication/register.dart';


class BuyItemPage extends StatefulWidget{
  @override
  State createState() => new BuyItemPageState();
}

class BuyItemPageState extends State<BuyItemPage>{

  final loginService _auth = loginService();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Buy an item"),
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
              child:RaisedButton(child: Text("testing buying"), color: Colors.deepOrange, textColor: Colors.white, onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()),);}),
            ),
            SizedBox(height:20),
          ],
        ),
      ),
    );
  }
}


