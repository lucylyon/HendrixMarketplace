import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hendrix_marketplace/pages/bottom_nav_page.dart';
import 'package:hendrix_marketplace/pages/profile_page.dart';
import 'package:hendrix_marketplace/user.dart';
import 'pages/edit_profile_page.dart';
import 'pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Hendrix Marketplace",
      theme: ThemeData(
          primaryColor: Colors.blueGrey,
          accentColor: Colors.orange
      ),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/EditProfilePage": (BuildContext context) => new EditProfilePage(),
        "/ProfilePage":(BuildContext context) => new ProfilePage(),
        "/HomePage" :(BuildContext context) => new HomePage()
      },
    );
  }
}


class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>{

  final loginService _auth = loginService();
  final _formKey = GlobalKey<FormState>();

  bool isValidUser = false;
  String email = "";
  String password = "";
  String uid = "";
  String error = "";


  final hintTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'OpenSans',
  );

  final labelStyle = TextStyle(
    color: Colors.deepOrangeAccent,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final boxDecorationStyle = BoxDecoration(
    color: Colors.deepOrangeAccent,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );


  Widget _buildEmailTF() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Email',
              style: labelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: boxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                validator: (text) => text.isEmpty ? "Enter something please" : null,
                onChanged: (text) {
                  setState(() => email = text);
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
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Password',
              style: labelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: boxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                obscureText: true,
                validator: (text) => text.length < 6 ? "Password has to be at least 6 characters long" : null,
                onChanged: (text) {
                  setState(() => password = text);
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
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
          ],
        )
    );
  }


  Widget _buildPasswordT() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Password',
              style: labelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: boxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                obscureText: true,
                validator: (text) => text.length < 6 ? "Password has to be at least 6 characters long" : null,
                onChanged: (text) {
                  setState(() => password = text);
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
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
          ],
        )
    );
  }


  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: labelStyle,
        ),
      ),
    );
  }


  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if(_formKey.currentState.validate()){
            print(email);
            print(password);
            dynamic result = await _auth.signInEmailPassword(email, password);
            if(result == null){
              setState(() => error = "Failed to sign in");
            }else{
              print(" #### AUTHENTICATED #### ");
              print(result);
              youShallPass();
            }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.orangeAccent,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }


  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an Account?",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Page for entering login info and attempting to login or creating a new user
  Widget loginPage(){
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      //TODO build the combined email and password tf
                      _buildEmailTF(),
                      _buildForgotPasswordBtn(),
                      _buildLoginBtn(),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// Check if user is authenticated and nav to the associated page
  @override
  Widget build(BuildContext context) {
    return isValidUser ? new BottomNavPage() : loginPage();
  }


  void youShallPass(){
    setState(() => isValidUser = !isValidUser);
  }


}

// Hold logic for logging in
class loginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Make init user class to pass between pages
  User _convert2User(FirebaseUser user){
    return user != null ? User(userName: user.displayName, uid: user.uid) : null;
  }


  Future signInEmailPassword(String email, String password) async {
    try{

      AuthResult authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = authResult.user;
      return _convert2User(user);

    } catch(e){

      print(e.toString());
      return null;

    }

  }


  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}


// https://www.youtube.com/watch?v=LBJoY4VjECo&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=5
// https://api.flutter.dev/flutter/material/Colors/orange-constant.html
// https://api.flutter.dev/flutter/material/RaisedButton-class.html