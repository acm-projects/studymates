import 'package:flutter/material.dart';
import 'package:studymates_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        /*
        Main app color. Swatch used because then the theme is propagated through children
        See: https://flutter.dev/docs/cookbook/design/themes
         */
        primarySwatch: Colors.indigo,
      ),
      home: new HomePage(),
    );
  }
}
