import 'dart:io';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:hendrix_marketplace/pages/home/home_page.dart';

import '../wrapper.dart';



class Connect{
  Future<void> send(Message message, String friendIp) async {
    return await sendToFriend(message, friendIp);
  }


  Future<String> sendToFriend(Message message, String friendIp) async {
    //TODO have method grab the ip aligned to the friendUid given to the method from the server

    //TODO as a place holder i am simply having the otherip be static to the bas
    await message.sendTo(friendIp, message);
    print("Message sent");
    return "";
  }
}




class Message{
  String displayName;
  String item;

  Message(this.displayName, this.item);


  String toJson() {
    return '{"displayName": "$displayName", '
        '"item": "$item"';
  }


  Message.fromJson(Map<String, dynamic> jsonObject) {
    this.displayName = jsonObject['displayName'];
    this.item = jsonObject['item'];
  }


  Future sendTo(String otherIp, Message message) async{
    try {
      Socket socket = await Socket.connect(otherIp as int, Wrapper.ourPort);
      socket.write(message.toJson());
      socket.close();
    } on SocketException catch (e) {
      return print(e);
    }
  }


  bool operator == (dynamic other) =>
      other != null && other is Message && other.displayName == displayName && other.item == item;

  @override
  int get hashCode => super.hashCode;

  Future<void> showMessage(Message message, BuildContext context) {
    Navigator.pushNamed(context, "/MessagePage", arguments: message);
    return null;
  }


}
