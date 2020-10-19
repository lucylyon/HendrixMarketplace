import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/user.dart';

class UserCard extends StatelessWidget {

  final User user;
  UserCard({this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(user.displayName),
          subtitle: Text(user.ip),
        ),
      ),
    );
  }
}
