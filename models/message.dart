import 'package:firebase_database/firebase_database.dart';

class Message {

  DatabaseReference _id;
  String author;
  String desc;

  Message(this.author, this.desc);


  void setId(DatabaseReference id){
    this._id = id;
  }

  DatabaseReference getId(){
    return this._id;
  }

  Map<String, dynamic> toJson(){
    return {
      'author': this.author,
      'desc': this.desc,
    };
  }

}