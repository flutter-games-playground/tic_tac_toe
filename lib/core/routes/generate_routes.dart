import 'package:flutter/material.dart';
import 'package:tic_tac_toe/main.dart';
import 'package:tic_tac_toe/view/pages/home_page.dart';
import 'package:tic_tac_toe/view/pages/register_page.dart';

RouteFactory customGenerateRoute = (settings) {
  final uri = Uri.parse(settings.name!);
  final queryParameters = uri.queryParametersAll;

  final tableName = queryParameters['table']?.first ?? '';
  final userName = sharedPreferences.getString('userName') ?? '';

  if (uri.path == '/') {
    if (userName.isEmpty) {
      return MaterialPageRoute(
        builder: (context) {
          return RegisterPage(
            // tableName: currentUser.tableId,
            tableName: tableName,
          );
        },
      );
    }

    if (tableName.isNotEmpty && userName.isNotEmpty) {
      return MaterialPageRoute(
        builder: (context) {
          return const HomePage(userName: '', tableName: '');
        },
      );
    }
  }

  assert(false, 'Need to implement ${settings.name}');
  return null;
};
