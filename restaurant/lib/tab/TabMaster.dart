import 'package:flutter/material.dart';
import 'package:restaurant/pages/Order.dart';
import 'package:restaurant/pages/Start.dart';
import 'package:restaurant/tab/second.dart';
import 'package:restaurant/ui/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DrinkTab.dart';
import 'MainTab.dart';

class TabMaster extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Restaurant APP"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.fastfood)),
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.local_drink)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MainTab(),
              DrinkTab(),
              SecondTab(),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async{
              SharedPreferences pref = await SharedPreferences.getInstance();
               pref.remove('pos');
              Navigator.push(context, MaterialPageRoute(builder: (context) => Start()));
            },
            icon: Icon(Icons.add),
            label: Text("Add"),
          ),
          bottomNavigationBar: BottomNavigation(),
        ),
      )

    );
  }


}
