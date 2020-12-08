import 'package:firebase_database/firebase_database.dart';

class Item {

  DatabaseReference _id;
  String name;
  String author;
  String cost;
  String desc;
  String state;

  Item(this.name, this.author, this.cost, this.desc, this.state);


  void setId(DatabaseReference id){
    this._id = id;
  }

  DatabaseReference getId(){
    return this._id;
  }

  void setState(String state){
    this.state = state;
  }

  Map<String, dynamic> toJson(){
    return {
      'name': this.name,
      'author': this.author,
      'cost': this.cost,
      'desc': this.desc,
      'state': this.state
    };
  }


}