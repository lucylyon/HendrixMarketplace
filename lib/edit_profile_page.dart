import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/main.dart';

class EditProfilePage extends StatefulWidget{
  @override
  State createState() => new EditProfilePageState();
}


class EditProfilePageState extends State<EditProfilePage> {


  final TextEditingController newUserName = new TextEditingController(text: "");


  void _saveInfo(){
    MyApp.userName = newUserName.text;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Profile"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              controller: newUserName,
              decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
            new RaisedButton.icon(
              onPressed: _saveInfo,
              icon: Icon(Icons.save),
              color: Colors.orange,
              label: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
