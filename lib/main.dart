import 'package:currency_app/theme/paths/routes.dart';
import 'package:flutter/material.dart';

import 'on_generate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute: Routes.onBoarding,
    onGenerateRoute: (settings){
      return RouteGenerator.generateRoute(settings);
    },
    );
  }
}

