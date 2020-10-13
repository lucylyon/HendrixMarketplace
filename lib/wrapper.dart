import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/models/user.dart';
import 'package:hendrix_marketplace/pages/authentication/authenticate.dart';
import 'package:hendrix_marketplace/pages/home/bottom_nav_page.dart';
import 'file:///C:/Users/morga/AndroidStudioProjects/hendrix_marketplace/HendrixMarketplace/lib/pages/home/home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // This accesses the User data from the Provider Stream
    final user = Provider.of<User>(context);
    print(user);

    //This will return either Home or auth page based on signin status
    if(user == null){
      return Authenticate();
    } else {
      return BottomNavPage();
    }
  }
}

