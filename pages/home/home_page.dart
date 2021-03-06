import 'package:hendrix_marketplace/pages/home/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/services/auth.dart';
import 'package:hendrix_marketplace/pages/authentication/register.dart';
import 'package:hendrix_marketplace/pages/home/buy_item_page.dart';
import 'package:hendrix_marketplace/pages/home/sell_item_page.dart';


class HomePage extends StatefulWidget{
  final String displayName;
  HomePage(this.displayName);

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
            Container( //inspired from boggle
              width: 300,
              height: 50,
              child:RaisedButton(child: Text("Buy an item"), color: Colors.deepOrangeAccent, textColor: Colors.white, onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BuyItemPage(widget.displayName)),);}),
            ),
            SizedBox(height:20),
            Container(
              width: 300,
              height: 50,
              child:RaisedButton(child: Text("Sell an item"), color: Colors.deepOrangeAccent, textColor: Colors.white, onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SellItemPage(widget.displayName)),);}),
            )
          ],
        ),
      ),
    );
  }
}


