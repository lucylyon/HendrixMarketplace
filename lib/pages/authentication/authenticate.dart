import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/pages/authentication/register.dart';
import 'package:hendrix_marketplace/pages/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
/*
  bool isValidUser = false;
  void youShallPass(){
    setState(() => isValidUser = !isValidUser);
  }

  @override
  Widget build(BuildContext context) {
    if(isValidUser){
      return SignIn(youShallPass: youShallPass );
    } else {
      return null;
    }
  }

 */
  @override
  Widget build(BuildContext context){
    return Container(
      child: SignIn(),
    );
  }
}
