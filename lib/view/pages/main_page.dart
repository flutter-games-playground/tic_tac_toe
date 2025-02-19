import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/routes/generate_routes.dart';
import 'package:tic_tac_toe/core/routes/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: routes, initialRoute: '/', onGenerateRoute: customGenerateRoute);
  }
}
