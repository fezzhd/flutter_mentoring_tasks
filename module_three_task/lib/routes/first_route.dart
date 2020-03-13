import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_three_task/generated/l10n.dart';
import '../utils/routes_names.dart' as RouteNames;

class FirstRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitAppDialog(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () async {
           var result = await _exitAppDialog(context);
           if (result){
             SystemNavigator.pop(animated: true); /// doesn't work on iOS
           }
          }),
          title: Text(AppLocalization.of(context).firstRouteTitle),
        ),
        body: SafeArea(
          child: Center(
            child: MaterialButton(
              color: Theme.of(context).buttonColor,
              child: Text(AppLocalization.of(context).pressMe),
              onPressed: () async {
                var result = await Navigator.of(context).pushNamed(RouteNames.secondRoute);
                if (result != null){
                  _showResultDialog(context, result);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _exitAppDialog(BuildContext context){
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalization.of(context).exitConfirmationTitle),
        content: Text(AppLocalization.of(context).exitConfirmationContent),
        actions: <Widget>[
          FlatButton(
            child: Text(AppLocalization.of(context).yes),
            onPressed: () => Navigator.of(context).pop(true)
          ),
          FlatButton(
              child: Text(AppLocalization.of(context).no),
              onPressed: () => Navigator.of(context).pop(false)
          )
        ],
      )
    );
  }

  Future _showResultDialog(BuildContext context, String result) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(

          title: Text(AppLocalization.of(context).resultIs(result)),
          actions: <Widget>[
            FlatButton(
                child: Text(AppLocalization.of(context).ok),
                onPressed: () => Navigator.of(context).pop()
            )
          ],
        )
    );
  }

}