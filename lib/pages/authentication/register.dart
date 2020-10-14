import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hendrix_marketplace/services/auth.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final loginService _auth = loginService();
  final _formKey = GlobalKey<FormState>();

  // Text field state
  String displayName = "";
  String ip = "";
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        title: Text("Register Form"),
        actions: <Widget> [
          FlatButton.icon(
              icon: Icon(Icons.person_add),
              label: Text("Register"),
              onPressed: () {}
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (text) =>
                text.isEmpty
                    ? "Enter something please"
                    : null,
                onChanged: (val) {
                  setState(() => displayName = val);
                },
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.orangeAccent,
                  ),
                  hintText: 'Enter your Display Name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val) {
                  setState(() => ip = val);
                },
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.security,
                    color: Colors.orangeAccent,
                  ),
                  hintText: 'Enter your IP Address',
                  hintStyle: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (text) =>
                text.isEmpty
                    ? "Enter something please"
                    : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.orangeAccent,
                  ),
                  hintText: 'Enter your Email',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (text) =>
                text.length < 6
                    ? "Password has to be at least 6 characters long"
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.orangeAccent,
                  ),
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    print(displayName);
                    print(ip);
                    print(email);
                    print(password);
                    dynamic authResult = await _auth.registerWithEmailPassword(displayName, ip, email, password);
                    if(authResult == null){
                      setState(() => error = "error registering new user");
                    }
                  }
                },
              ),
              SizedBox(height: 20,),
              Text(error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


//https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter