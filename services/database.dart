import 'package:firebase_database/firebase_database.dart';
import 'package:hendrix_marketplace/models/item.dart';
import 'package:hendrix_marketplace/models/message.dart';


final databaseInstance = FirebaseDatabase.instance;
final databaseRef = databaseInstance.reference();

DatabaseReference saveItem(Item item){
  var id = databaseRef.child('items/').child("onSale/").push();
  id.set(item.toJson());
  Message initMessage = new Message(item.author, "I am selling " + item.name + " for " + item.cost);
  saveMessage(id, initMessage);
  return id;
}


Item createItem(i) {
  Map<String, dynamic> keys = {
    'name': '',
    'author': '',
    'cost': '',
    'desc': '',
    'state': ''
  };

  i.forEach((key, value) => {keys[key] = value});
  Item item = new Item(keys["name"], keys["author"], keys["cost"], keys["desc"], keys["state"]);
  return item;

}


void changeItemState1(Item item, String state){
  if(state == "open"){

  }else{
    item.getId().remove();
    item.setState(state);
    var id = databaseRef.child('items/').child("sold/").push();
    id.set(item.toJson());
  }
}



Future<List<Item>> getOpenItemList() async {
  DataSnapshot dS = await databaseRef.child('items/').child('onSale/').once();
  List<Item> items = [];
  if(dS.value != null){
    dS.value.forEach((key, value) {
      Item item = createItem(value);
      item.setId(databaseRef.child('items/').child('onSale/' + key));
      items.add(item);
    });
  }
  return items;
}



Message createMessage(m) {
  Map<String, dynamic> keys = {
    'author': '',
    'desc': '',
  };
  m.forEach((key, value) => {keys[key] = value});
  Message message = new Message(keys["author"],keys["desc"]);
  return message;
}



DatabaseReference saveMessage(DatabaseReference id, Message message){
  var messageId = id.child("messages/").push();
  messageId.set(message.toJson());
  return messageId;
}




Future<List<Message>> getMessageList(Item item) async {
  DataSnapshot dS = await item.getId().child("messages/").once();
  List<Message> messages = [];
  if(dS.value != null){
    dS.value.forEach((key, value) {
      Message message = createMessage(value);
      message.setId(databaseRef.child('items/').child('onSale/' + key));
      messages.add(message);
    });
  }
  return messages;
}
