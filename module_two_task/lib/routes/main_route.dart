import 'package:flutter/material.dart';
import 'package:module_two/generated/l10n.dart';

const int _numberOfChips = 10;

class MainRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chipWidgetList = Iterable<int>.generate(_numberOfChips).map((element) =>
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          label: Text(AppLocalization.of(context).chip(element + 1))
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: 100,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(AppLocalization.of(context).hello)),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 20,
                  runAlignment: WrapAlignment.spaceBetween,
                  children:  chipWidgetList.toList(),
                ),
                Builder(
                  builder: (ctx) => MaterialButton(
                    onPressed: () => Scaffold.of(ctx).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalization.of(context).hello),
                      )),
                    child: Text(AppLocalization.of(context).pressMe),
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
