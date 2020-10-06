import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/pages/profile_page.dart';

import 'home_page.dart';

class BottomNavPage extends StatefulWidget{
  @override
  State createState() => new BottomNavPageState();
}


class BottomNavPageState extends State<BottomNavPage>{

  static ProfilePage p = new ProfilePage();
  static HomePage h = new HomePage();



  int _currentIndex = 1;
  final List<Widget> _children = [
    p,
    h,
  ];



  void tappedBar(index){
    setState(() {
      _currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.face),
                title: Text("Profile"),
                backgroundColor: Colors.orange
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                backgroundColor: Colors.orangeAccent
            ),
          ],
          onTap: tappedBar
      ),
    );
  }
}

