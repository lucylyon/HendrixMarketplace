import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection("Users");

  Future updateUserData(String displayName, String ip) async {
    return await userCollection.document(uid).setData({
      'displayName': displayName,
      'ip': ip,
    });
  }

  // Gives us a snapshot of a document and tells us data.
  User _userDataFromSnapshot(DocumentSnapshot snapshot){
    return User(
      uid: uid,
      displayName: snapshot.data["displayName"],
      ip: snapshot.data["ip"]
    );
  }

  List<User> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return User(
        displayName: doc.data["displayName"],
        ip: doc.data["ip"],
        uid: doc.data["uid"] ?? "Placeholder",
      );
    }).toList();
  }

  Stream<List<User>> get users {
    return userCollection.snapshots()
        .map(_userListFromSnapshot);
  }

  Stream<User> get userData{
    return userCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }


}