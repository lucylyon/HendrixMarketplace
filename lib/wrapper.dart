import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/user.dart';
import 'package:hendrix_marketplace/pages/authentication/authenticate.dart';
import 'package:hendrix_marketplace/pages/home/bottom_nav_page.dart';
import 'package:hendrix_marketplace/services/connect.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static int ourPort = 4444;



  Message message;
  User user;
  FirebaseUser firebaseUser;
  Firestore fireStore;
  String userName;
  String otherName;
  String userIp;
  String otherIp;

//TODO during init get the correct values for friend and curr user IP and store them in the values above for later use.
  Future<void> init(BuildContext context) async {

    userName = user.displayName;
    userIp = user.ip;
    otherIp = "127.0.0.1";

    try {
      ServerSocket server =
      await ServerSocket.bind(InternetAddress.anyIPv4, ourPort);
      server.listen((data) {
        message = _listen(data, context);
      }); // StreamSubscription<Socket>
      print("Message received");

      //TODO send to a page displaying the message or have the message pop up

      return message.showMessage(message, context);
    } on SocketException catch (e) {
      return print(e);
    }
  }


  Message _listen(Socket socket, BuildContext context) {
    Message dataReceived;
    socket.listen((data) {
      dataReceived = _handleMessage(socket.address.address, data, context);
    });
    return dataReceived;
  }


  Message _handleMessage(String ip, Uint8List incomingData,
      BuildContext context) {
    Message received = Message.fromJson(
        jsonDecode(String.fromCharCodes(incomingData)));
    print("Received '$received' from '$ip'");
    return received;
  }








  @override
  Widget build(BuildContext context) {

    // This accesses the User data from the Provider Stream
    final user = Provider.of<User>(context);
    print(user);

    //This will return either Home or auth page based on signin status
    if(user == null){
      return Authenticate();
    } else {
      return BottomNavPage();
    }
  }
}

