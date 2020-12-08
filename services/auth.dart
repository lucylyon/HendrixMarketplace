import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/user.dart';


// ignore: camel_case_types
class loginService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Make init user class to pass between pages
  // User _convert2User(dynamic user){
  //   return user != null ? User(displayName: user.displayName, uid: user.uid) : null;
  // }
  //
  // Stream<User> get user {
  //   return _auth.onAuthStateChanged.map(_convert2User);
  // }


  Future signInAnonymously() async {
    try{
      dynamic results = await _auth.signInAnonymously();
      FirebaseUser user = results.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }

  }


// Lets user sign in with an email and password
  Future signInEmailPassword(String email, String password) async {
    try{
      dynamic authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = authResult.user;
      return user;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

// Lets user register account

  Future registerWithEmailPassword(String displayName, String email, String password) async{
    try{
      dynamic authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = authResult.user;
      // _saveUserInfo(displayName, user);
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  
  
//Save user data to the server for later use
//   void _saveUserInfo(String displayName, FirebaseUser user){
//     DocumentReference documentReference = fireStore.collection("Users").document(currUid);
//     Map<String,Object> User = new HashMap<String,Object>();
//     User.putIfAbsent("displayName", () => displayName);
//     User.putIfAbsent("ip", () => ip);
//     User.putIfAbsent("uid", () => currUid);
//     documentReference.setData(User).whenComplete(() => print(User.toString() + "#### ADDED TO DATABASE ####"));
//   }


// Lets user sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}
