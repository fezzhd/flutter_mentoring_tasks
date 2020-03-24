
import 'package:flutter/material.dart';

class PostRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder(
                  builder: (context, snapshot) {
                    if (!snapshot.hasData){
                      return Text("No Data here");
                    } else {
                      return FlutterLogo();
                    }
                  },
                ),
                MaterialButton(
                  child: Text("Select post"),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}