import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/item.dart';
import 'package:hendrix_marketplace/models/message.dart';
import 'package:hendrix_marketplace/pages/home/contact_page.dart';
import 'package:hendrix_marketplace/services/database.dart';


class MessageList extends StatefulWidget {

  final List<Message> messages;
  // final Item item;

  MessageList(this.messages);


  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  // void loadOpenTickets(){
  //   getOpenItemList().then((items) => {
  //     this.setState(() {
  //       this.widget.items = items;
  //     })
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        var message = this.widget.messages[index];
        return Card(
          child: Padding(
            padding: EdgeInsets.only(
                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(message.desc,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        message.author,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: this.widget.messages.length,
    );
  }
}


// https://stackoverflow.com/questions/54986328/how-to-make-expandable-card