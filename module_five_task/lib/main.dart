import 'package:flutter/material.dart';
import 'package:module_five_task/routes/inherited_widgets/post_inherited_widget.dart';
import 'package:module_five_task/routes/routes_widgets/post_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostInheritedWidget(widget: PostRoute()),
    );
  }
}
