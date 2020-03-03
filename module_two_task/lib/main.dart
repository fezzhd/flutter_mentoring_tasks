import 'package:flutter/material.dart';
import 'package:module_two/routes/main_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange
      ),
      title: 'Module Two Task',
      home: MainRoute(),
    );
  }
}
