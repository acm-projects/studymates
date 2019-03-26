import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StudyMates"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("John Doe"),
                accountEmail: Text("jxd000000@utdallas.edu"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor, // not sure if cardcolor is right for this?
                  child: Icon(Icons.person),
                ),
              ),

              ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),

              ListTile(
                title: Text("Upcoming Sessions"),
                leading: Icon(Icons.alarm),
              ),
            ]
          )
        ),
      )
    );
  }
}
