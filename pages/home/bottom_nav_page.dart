import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hendrix_marketplace/pages/home/profile_page.dart';

import 'home_page.dart';

class BottomNavPage extends StatefulWidget{
  final String displayName;
  BottomNavPage(this.displayName);


  @override
  State createState() => new BottomNavPageState();
}


class BottomNavPageState extends State<BottomNavPage>{

  int _currentIndex = 1;

  void tappedBar(index){
    setState(() {
      _currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

    ProfilePage p = new ProfilePage(widget.displayName);
    HomePage h = new HomePage(widget.displayName);

    final List<Widget> _children = [
      p,
      h,
    ];


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

