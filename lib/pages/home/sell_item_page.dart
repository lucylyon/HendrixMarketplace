import 'package:hendrix_marketplace/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/services/auth.dart';
import 'package:hendrix_marketplace/models/item.dart';


class SellItemPage extends StatefulWidget{
  @override
  State createState() => new SellItemPageState();
}

class SellItemPageState extends State<SellItemPage> {

  final loginService _auth = loginService();
  final _formKey = GlobalKey<FormState>();
  String _itemName, _itemCost, _itemDesc;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sell an item"),
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
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: boxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                validator: (text) =>
                text.isEmpty
                    ? "Enter something please"
                    : null,
                onChanged: (text) {
                  setState(() => _itemName = text);
                },
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 14.0),
                  hintText: 'What are you selling?',
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: boxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                validator: (text) =>
                text.isEmpty
                    ? "Enter something please"
                    : null,
                onChanged: (text) {
                  setState(() => _itemCost = text);
                },
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 14.0),
                  hintText: 'What is the price?',
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: boxDecorationStyle,
              height: 120.0,
              child: TextFormField(
                validator: (text) =>
                text.isEmpty
                    ? "Enter something please"
                    : null,
                onChanged: (text) {
                  setState(() => _itemDesc = text);
                },
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 14.0),
                  hintText: 'Item description: ',
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150.0),
            child: Container(
              width: 100,
              height: 50,
              child:RaisedButton(child: Text("Sell"), color: Colors.deepOrange, textColor: Colors.white,
                  onPressed: (
                    // var item = Item({name: _itemName, cost: _itemCost, desc: _itemDesc});
                         //_itemName, _itemCost, _itemDesc);

                  ) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);}),
            ),
          )
        ],
      )
    );
  }

  final hintTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'OpenSans',
  );

  final labelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final boxDecorationStyle = BoxDecoration(
    color: Colors.orangeAccent,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}