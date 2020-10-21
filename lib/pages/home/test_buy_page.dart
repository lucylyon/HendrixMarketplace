import 'package:hendrix_marketplace/models/user.dart';
import 'package:flutter/material.dart';

import 'package:hendrix_marketplace/services/connect.dart';
import 'package:provider/provider.dart';
import 'package:hendrix_marketplace/services/database.dart';


class TestBuyPage extends StatefulWidget{
  @override
  State createState() => new TestBuyPageState();
}

class TestBuyPageState extends State<TestBuyPage>{

  Connect connect = new Connect();
  User _user = User();


  @override
  Widget build(BuildContext context){

    return StreamProvider<List<User>>.value(
        value: DatabaseService().users,
        child: new Scaffold(
            body: Container(
              color: Colors.white10,
              padding: const EdgeInsets.all(80.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container( //inspired from boggle
                    width: 300,
                    height: 50,
                    child:RaisedButton(child: Text("Buy Tuba"), color: Colors.deepOrangeAccent, textColor: Colors.white, onPressed: () {buyOne();}),
                  ),
                  SizedBox(height:20),
                  Container(
                    width: 300,
                    height: 50,
                    child: RaisedButton(child: Text("Buy #####"),
                        color: Colors.deepOrangeAccent,
                        textColor: Colors.white,
                        onPressed: () {}
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }

  void buyOne() {
    Message message = Message(_user.displayName, "Tuba");
    connect.send(message, _user.displayName);
  }
}


