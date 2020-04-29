import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> pushRoute(String toNameRoute){
    return navigatorKey.currentState.pushNamed(toNameRoute);
  }

  void navigateBack<T>({T result}) {
    navigatorKey.currentState.pop(result);
  }
}