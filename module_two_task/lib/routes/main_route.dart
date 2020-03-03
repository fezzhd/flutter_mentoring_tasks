import 'package:flutter/material.dart';

class MainRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Module Two taks"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}
