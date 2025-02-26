import 'package:flutter/material.dart';
import 'package:tic_tac_toe/main.dart';
import 'package:tic_tac_toe/view/pages/home_page.dart';
import 'package:tic_tac_toe/view/pages/register_page.dart';
import 'package:tic_tac_toe/view_model/game_type_abstract.dart';

RouteFactory customGenerateRoute = (settings) {
  final uri = Uri.parse(settings.name!);
  final queryParameters = uri.queryParametersAll;
  late GameTypeAbstract gameTypeAbstract;

  final tableName = queryParameters['table']?.first ?? '';
  final gameMode = queryParameters['gameMode']?.first ?? '';
  final userName = sharedPreferences.getString('userName') ?? '';

  if (uri.path == '/') {
    if (userName.isEmpty) {
      return MaterialPageRoute(
        builder: (context) {
          return RegisterPage(tableName: tableName);
        },
      );
    }

    if (tableName.isNotEmpty && userName.isNotEmpty) {
      switch (gameMode) {
        case 'Infinity':
          gameTypeAbstract = GameTypeInfinity();
          break;
        default:
          gameTypeAbstract = GameTypeNormal();
      }
      return MaterialPageRoute(
        builder: (context) {
          return HomePage(userName: userName, tableName: tableName, controller: gameTypeAbstract);
        },
      );
    }
  }

  assert(false, 'Need to implement ${settings.name}');
  return null;
};
