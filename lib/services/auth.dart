import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/user.dart';


// ignore: camel_case_types
class loginService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore fireStore = Firestore.instance;
  String currUid;

  //Make init user class to pass between pages
  User _convert2User(FirebaseUser user){
    return user != null ? User(displayName: user.displayName, uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_convert2User);
  }

// Lets user sign in with an email and password
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

// Lets user register account

  Future registerWithEmailPassword(String displayName, String ip, String email, String password) async{
    try{
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = authResult.user;
      //TODO figure out how to save ip and display name in the server
      _saveUserInfo(displayName, ip, user);





      return _convert2User(user);
    }catch(e){
      print(e.toString());
      return null;
    }
    
  }
  
  
//Save user data to the server for later use
  void _saveUserInfo(String displayName, String ip, FirebaseUser user){
    currUid = user.uid;
    DocumentReference documentReference = fireStore.collection("Users").document(currUid);
    Map<String,Object> User = new HashMap<String,Object>();
    User.putIfAbsent("displayName", () => displayName);
    User.putIfAbsent("ip", () => ip);
    User.putIfAbsent("uid", () => currUid);
    documentReference.setData(User).whenComplete(() => print(User.toString() + "#### ADDED TO DATABASE ####"));
  }


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