import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tic_tac_toe/view/pages/main_page.dart';

late final SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setUrlStrategy(PathUrlStrategy());

  sharedPreferences = await SharedPreferences.getInstance();

  runApp(const MainPage());
}
