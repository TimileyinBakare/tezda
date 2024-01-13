import 'package:flutter/material.dart';
import 'package:tezda_task/core/modules/product/view/screen/product_list_screen.dart';

class Routes {
  static const String signup = '/signup';
  static const String login = '/login';
  static const String product = '/productList';

  static late GlobalKey<NavigatorState> navigatorKey;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => _generateRoute(settings));
  }

  static Widget _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case product:
        return const ProductListScreen();
      default:
        return const ProductListScreen();
    }
  }
}
