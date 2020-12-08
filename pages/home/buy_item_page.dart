import 'package:hendrix_marketplace/models/item.dart';
import 'package:hendrix_marketplace/models/user.dart';
import 'package:hendrix_marketplace/pages/home/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/services/auth.dart';
import 'package:hendrix_marketplace/pages/authentication/register.dart';
import 'package:hendrix_marketplace/services/database.dart';
import 'package:hendrix_marketplace/widgets/item_list.dart';
import 'package:provider/provider.dart';


class BuyItemPage extends StatefulWidget{
  final String displayName;
  BuyItemPage(this.displayName);


  @override
  State createState() => new BuyItemPageState();
}

class BuyItemPageState extends State<BuyItemPage> {

  final loginService _auth = loginService();

  List<Item> items = [];

  void newTicket(String name, String cost, String description) {
    var item = new Item(name, widget.displayName, cost, description, "onSale");
    var itemId = saveItem(item);
    item.setId(itemId);
    this.setState(() {
      items.add(item);
    });
  }

  void loadOpenItems() {
    getOpenItemList().then((tickets) => {
      this.setState(() {
        this.items = tickets;
      })
    });
  }

  @override
  void initState() {
    super.initState();
    loadOpenItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Buy an Item"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Expanded(child: ItemList(this.items, widget.displayName)),
              ]),
        ),
    );

  }
}


