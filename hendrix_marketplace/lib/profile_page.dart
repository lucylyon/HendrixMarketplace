import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  @override
  State createState() => new ProfilePageState();
}


class User {
}


class ProfilePageState extends State<ProfilePage> {


  final TextEditingController textFieldOne = new TextEditingController(text: "");
  final TextEditingController textFieldTwo = new TextEditingController(text: "");


  void _saveInfo(){
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
              textAlign: TextAlign.center,
              controller: textFieldTwo,
              decoration: InputDecoration(
                  hintText: "Something",
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            new TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              controller: textFieldOne,
              decoration: InputDecoration(
                  hintText: "Another thing",
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            new RaisedButton.icon(
              onPressed: _saveInfo,
              icon: Icon(Icons.assignment),
              color: Colors.greenAccent,
              label: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}