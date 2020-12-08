import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/item.dart';
import 'package:hendrix_marketplace/models/message.dart';
import 'package:hendrix_marketplace/services/database.dart';
import 'package:hendrix_marketplace/widgets/message_list.dart';
import 'package:hendrix_marketplace/widgets/text_field.dart';

class ContactPage extends StatefulWidget {
  final Item item;
  final displayName;
  ContactPage(this.item, this.displayName);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool isAdmin = false;
  bool isOpen = true;
  List<Message> messages = [];

  void newMessage(String text) {
    setIsOpen();
    if (isOpen) {
      var message = new Message(widget.displayName, text);
      var messageId = saveMessage(widget.item.getId(), message);
      message.setId(messageId);
      this.setState(() {
        messages.add(message);
      });
    } else {
      print(text + "\n cannot be created. the item is already sold.");
    }
  }

  void loadMessages() {
    getMessageList(widget.item).then((messages) => {
          this.setState(() {
            this.messages = messages;
          })
        });
  }

  void checkAdmin() {
    if (widget.displayName == widget.item.author) {
      isAdmin = true;
    } else {
      isAdmin = false;
    }
  }

  void setIsOpen() {
    if (widget.item.state == "sold") {
      isOpen = false;
    }
  }

  void changeState(Item item) {
    print(item.getId().toString());
    if (isAdmin) {
      if (item.state == "onSale") {
        this.setState(() {
          changeItemState1(item, "sold");
        });
      } else {}
    }
  }

  Widget customText(Item item) {
    if (isOpen) {
      return Text(
        widget.item.state,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      );
    } else {
      return Text(
        widget.item.state,
        style: TextStyle(color: Colors.white, fontSize: 20),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkAdmin();
    setIsOpen();
    loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.money_off, color: Colors.white,),
            label: customText(widget.item),
            onPressed: () {
              setState(() {
                changeState(widget.item);
              });
            },
          ),
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
              Expanded(child: MessageList(this.messages)),
              TextFieldWidget(this.newMessage)
            ]),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Stack(children: [
  //         Expanded(
  //           child: Row(
  //             children: [
  //               Column(
  //                 children: [
  //                   IconButton(
  //                     icon: Icon(Icons.refresh),
  //                     onPressed: () {
  //                       loadMessages();
  //                     },
  //                   )
  //                 ],
  //               ),
  //               Positioned.fill(
  //                   child: Column(
  //                     children: [
  //                       Expanded(
  //                         child: Container(
  //                           color: Colors.blueAccent,
  //                         ),
  //                       ),
  //                       Expanded(
  //                         child: Container(
  //                           color: Colors.white,
  //                         ),
  //                       )
  //                     ],
  //                   )),
  //               Container(
  //                   margin: EdgeInsets.only(top: 25.0),
  //                   child: Align(
  //                     alignment: Alignment.topCenter,
  //                     child: Row(
  //                       children: [
  //                         IconButton(
  //                           icon: Icon(Icons.arrow_back),
  //                           onPressed: () {
  //                             Navigator.pop(context);
  //                           },
  //                         )
  //                       ],
  //                     ),
  //                   )),
  //               Container(
  //                 margin: EdgeInsets.only(top: 65.0, right: 35.0, left: 35.0),
  //                 child: Align(
  //                   alignment: Alignment.topCenter,
  //                   child: Container(
  //                     height: 125,
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(20),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.grey.withOpacity(0.5),
  //                           spreadRadius: 5,
  //                           blurRadius: 7,
  //                           offset: Offset(0, 3), // changes position of shadow
  //                         ),
  //                       ],
  //                     ),
  //                     child: Center(
  //                         child: Container(
  //                             child: Column(
  //                               children: [
  //                                 Text(
  //                                   widget.item.name,
  //                                   style: TextStyle(fontSize: 65),
  //                                 ),
  //                                 Text(
  //                                   widget.item.cost,
  //                                   style: TextStyle(fontSize: 35, color: Colors.black38),
  //                                 ),
  //                               ],
  //                             ))),
  //                   ),
  //                 ),
  //               ),
  //               Align(
  //                 alignment: Alignment.bottomCenter,
  //                 child: Container(
  //                   height: 600,
  //                   decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(40.0),
  //                           topRight: Radius.circular(40.0))),
  //                   child: Align(
  //                     alignment: Alignment.topLeft,
  //                     child: Column(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsets.all(10.0),
  //                         ),
  //                         SizedBox(
  //                           height: 25.0,
  //                         ),
  //                         Expanded(child: MessageList(this.messages)),
  //                         TextFieldWidget(this.newMessage),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Align(
  //                   alignment: Alignment.topCenter,
  //                   child: GestureDetector(
  //                     onTap: () {
  //                       setState(() {
  //                         changeState(widget.item);
  //                       });
  //                     },
  //                     child: Container(
  //                       height: 100,
  //                       child: Row(
  //                         children: [
  //                           Expanded(
  //                             child: Container(
  //                               height: 60,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.orangeAccent,
  //                                   borderRadius: BorderRadius.circular(20)),
  //                               child: Center(
  //                                 child: customText(widget.item),
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ))
  //             ],
  //           ),
  //         )

  //   ]));
  // }
}
