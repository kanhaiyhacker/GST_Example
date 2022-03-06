import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic data}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: data);
  }

  Future<dynamic> pushAndRemoveUntil(String routeName, String deletionRoute,
      {dynamic data}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(deletionRoute),
        arguments: data);
  }

  void pop({String? value}) {
    return navigatorKey.currentState!.pop(value);
  }

  void popUntil({String? value}) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(value!));
  }
}
