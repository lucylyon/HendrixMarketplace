import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/user.dart';



class ProfilePage extends StatefulWidget{
  final String displayName;
  ProfilePage(this.displayName);


  @override
  State createState() => new ProfilePageState();
}


class ProfilePageState extends State<ProfilePage> {

  // void _editInfo(){
  //   {Navigator.of(context).pushNamed("/EditProfilePage");}
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
              ),
              Container(
                color: Colors.grey,
                padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.35,
                color: Colors.white,
                child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                        ),
                        RaisedButton.icon(
                            padding: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
                            onPressed: (){},
                            icon: Icon(Icons.edit),
                            color: Colors.orange,
                            label: Text("Edit")
                        )
                      ],
                    ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: 0, right: 265, top: 30, bottom: 0),
                child: Text("Thing 1", style: TextStyle(fontSize: 20,letterSpacing: 1,color: Colors.white, fontWeight: FontWeight.bold
                ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: 265, right: 0, top: 30, bottom: 0),
                child: Text("Thing 2", style: TextStyle(fontSize: 20,letterSpacing: 1,color: Colors.white, fontWeight: FontWeight.bold
                ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 0),
              child: Text(widget.displayName, style: TextStyle(fontSize: 30,letterSpacing: 1,color: Colors.white, fontWeight: FontWeight.bold
              ),
              ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 1.25,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(width: 5),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('images/Squidward.png')
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
