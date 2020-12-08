import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/services/auth.dart';
import 'package:hendrix_marketplace/models/item.dart';
import 'package:hendrix_marketplace/services/database.dart';


class SellItemPage extends StatefulWidget{
  final String displayName;
  SellItemPage(this.displayName);

  @override
  State createState() => new SellItemPageState();
}

class SellItemPageState extends State<SellItemPage> {

  final loginService _auth = loginService();
  String _itemName = "";
  String _itemCost = "";
  String _itemDesc = "";


  @override
  Widget build(BuildContext context) {
   // currUid = _auth.currUid;
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
                  onPressed: () {
               Item item =  new Item(_itemName, widget.displayName, _itemCost, _itemDesc, "onSale");
                _saveItemInfo(item);
                Navigator.pop(context);}
            ),
          )
          )
        ],
      )
    );
  }


  // Item _createNewItem(String _name, String _cost, String _desc){
  //   return new Item(name: _name, cost: _cost, desc: _desc);
  // }

  void _saveItemInfo(Item item){
    saveItem(item);
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