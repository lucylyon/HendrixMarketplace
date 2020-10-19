import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/user.dart';
import 'package:hendrix_marketplace/pages/home/user_card.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<User>>(context) ?? [];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserCard(user: users[index],);
      },
    );
  }
}
