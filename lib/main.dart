import 'package:flutter/material.dart';
import 'package:tezda_task/core/shared/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    Routes.navigatorKey = navigatorKey;

    return ProviderScope(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
