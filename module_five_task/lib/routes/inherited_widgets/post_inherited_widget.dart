import 'package:flutter/material.dart';

class PostInheritedWidget extends InheritedWidget{

  PostInheritedWidget({Key key, Widget widget}) : super(key: key, child: widget);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static PostInheritedWidget of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<PostInheritedWidget>();

}