import 'package:flutter/material.dart';
import 'package:module_three_task/generated/l10n.dart';

final String _firstButtonResult = "42";
final String _secondButtonResult = "AbErVaLlG";

class SecondRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:() => Navigator.of(context).pop()),
        title: Text(AppLocalization.of(context).secondRouteTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                color: Theme.of(context).buttonColor,
                onPressed: () => Navigator.of(context).pop(_firstButtonResult),
                child: Text(
                  AppLocalization.of(context).returnButton(_firstButtonResult)
                ),
              ),
              MaterialButton(
                color: Theme.of(context).buttonColor,
                onPressed: () => Navigator.of(context).pop(_secondButtonResult),
                child: Text(
                  AppLocalization.of(context).returnButton(_secondButtonResult)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}