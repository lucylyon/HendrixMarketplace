import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hendrix_marketplace/models/user.dart';
import 'package:hendrix_marketplace/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/services/auth.dart';
import 'package:hendrix_marketplace/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hendrix_marketplace/wrapper.dart';


class SellItemPage extends StatefulWidget{

  @override
  State createState() => new SellItemPageState();
}

class SellItemPageState extends State<SellItemPage> {

  final loginService _auth = loginService();
  String _itemName = "";
  String _itemCost = "";
  String _itemDesc = "";
  var item = new Item();
  final Firestore fireStore = Firestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String currUid;
  User currUser;

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
               item =  _createNewItem( _itemName, _itemCost, _itemDesc);
                _saveItemInfo(item);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);}),
            ),
          )
        ],
      )
    );
  }


  Item _createNewItem(String _name, String _cost, String _desc){
    return new Item(name: _name, cost: _cost, desc: _desc);
  }

  void _saveItemInfo(Item item){
    currUser = _convert2User(_firebaseAuth.currentUser() as FirebaseUser);
    currUid = currUser.uid;
    DocumentReference documentReference = fireStore.collection("Users").document(currUid);
    Map<String,Object> itemMap = new HashMap<String,Object>();
    itemMap.putIfAbsent("name", () => item.name);
    itemMap.putIfAbsent("cost", () => item.cost);
    itemMap.putIfAbsent("desc", () => item.desc);
    itemMap.putIfAbsent("uid", () => currUid);
    documentReference.setData(itemMap).whenComplete(() => print(itemMap.toString() + "#### ADDED TO DATABASE ####"));
  }

  User _convert2User(FirebaseUser user){
    currUser = new User(displayName: user.displayName, uid: user.uid);
    return user != null ? User(displayName: user.displayName, uid: user.uid) : null;
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