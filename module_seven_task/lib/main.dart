import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:module_seven_task/routes/map_route.dart';
import 'package:module_seven_task/routes/video_route.dart';
import 'package:module_seven_task/routes/web_view_route.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:_BottomNavigationRoute()
    );
  }
}

class _BottomNavigationRoute extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _BottomNavigationState();

}

class _BottomNavigationState extends State<_BottomNavigationRoute>{

  int _selectedIndex = 0;
  final List<Widget> _widgetList = <Widget> [
    WebViewRoute(),
    MapRoute(),
    VideoRoute()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).title),
      ),
      body: _widgetList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _itemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            title: Text(AppLocalization.of(context).web_view)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text(AppLocalization.of(context).map)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            title: Text(AppLocalization.of(context).video)
          )
        ],
      ),
    );
  }


  void _itemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}

