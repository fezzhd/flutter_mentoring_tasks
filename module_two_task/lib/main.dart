import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:module_two/generated/l10n.dart';
import 'package:module_two/routes/main_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: AppLocalization.delegate.supportedLocales,
      theme: ThemeData(
          primaryColor: Colors.orange,
          accentColor: Colors.red
      ),
      home: MainRoute()
    );
  }
}
