import 'dart:io';
import 'package:flutter/material.dart';
import 'package:restaurant/pages/Order.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.blue[900],
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: new TextStyle(
                  color: Colors
                      .black))), // sets the inactive color of the `BottomNavigationBar`
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.border_color), title: Text('Order')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Login')),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app), title: Text('Exit')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }


  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        {
         return Navigator.push(context, MaterialPageRoute(builder: (context) => Order()));

        }
      case 1:
        {
          return Navigator.pushNamed(context, '/login');
        }
      case 2:
        {
          exit(0);
        }

    }
  }
}
