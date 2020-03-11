import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:module_three_task/utils/routes_names.dart' as RouteNames;
import 'generated/l10n.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: AppLocalization.delegate.supportedLocales,
      theme: ThemeData(
        primaryColor: Colors.blue,
        buttonColor: Colors.cyanAccent,
        primaryTextTheme: TextTheme(
          button: TextStyle(
            color: Colors.black
          )
        )
      ),
      initialRoute: RouteNames.initialRoute,
      onGenerateRoute: _generateRoutes,
    );
  }

  Route<dynamic> _generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RouteNames.initialRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => FirstRoute()
        );
      case RouteNames.secondRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => SecondRoute()
        );
      default:
        return null;
    }
  }
}
