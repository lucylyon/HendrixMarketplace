import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/item.dart';
import 'package:hendrix_marketplace/pages/home/contact_page.dart';
import 'package:hendrix_marketplace/services/database.dart';


class ItemList extends StatefulWidget {

  List<Item> items;
  final dynamic displayName;

  ItemList(this.items, this.displayName);


  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {

  void buttonHandler(Item item){
    if(item.state == "onSale"){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ContactPage(item, widget.displayName)));
    }else{

    }
  }

  void loadOpenTickets(){
    getOpenItemList().then((items) => {
      this.setState(() {
        this.widget.items = items;
      })
    });
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        var item = this.widget.items[index];
        return Card(
          child: Padding(
            padding: EdgeInsets.only(
                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
            child: ExpansionTile(
              title: Text(item.name),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Seller: "),
                    Text(item.author)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Cost: "),
                    Text(item.cost),
                  ],
                ),
                FlatButton(
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(6.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {buttonHandler(item);},
                  child: Text(
                      "Contact Seller"
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: this.widget.items.length,
    );
  }
}


// https://stackoverflow.com/questions/54986328/how-to-make-expandable-card