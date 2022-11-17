import 'package:flutter/material.dart';
import 'package:proform3/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal[300]
      ),
      home: HomePage(),
    );
  }
}
