import 'package:flutter/material.dart';

import 'package:studymates_app/fragments/settings_fragment.dart';
import 'package:studymates_app/fragments/friends_fragment.dart';
import 'package:studymates_app/fragments/my_sessions_fragment.dart';
import 'package:studymates_app/fragments/upcoming_sessions_fragment.dart';
import 'package:studymates_app/fragments/profile_fragment.dart';

/**
 * Fragment drawer approach from
 * https://medium.com/@kashifmin/flutter-setting-up-a-navigation-drawer-with-multiple-fragments-widgets-1914fda3c8a8
 */

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("My Profile", Icons.person),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("Friends", Icons.people),
    new DrawerItem("My Sessions", Icons.alarm),
    new DrawerItem("Upcoming Sessions", Icons.alarm),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0: // Profile fragment MUST be the first index in the case
        return new ProfileFragment();
      case 1:
        return SettingsFragment();
      case 2:
        return FriendsFragment();
      case 3:
        return new MySessionsFragment();
      case 4:
        return new UpcomingSessionsFragment();
      default:
        return new Text("Fragment index out of bounds");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    drawerOptions.add(new UserAccountsDrawerHeader(
      accountName: new Text("John Doe"),
      accountEmail: new Text("jxd120000@utdallas.edu"),
      onDetailsPressed: () {
        _onSelectItem(0); // not super elegant but it will do for now
      },
    ));
    for (int i = 1; i < widget.drawerItems.length; i++) {
      var item = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(item.icon),
        title: new Text(item.title),
        selected: i+1 == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: drawerOptions,
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
