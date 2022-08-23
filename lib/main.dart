import 'package:flutter/material.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/WeatherScreen.dart';
import 'Screens/changeCity.dart';

void main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.dark,
    theme: ThemeData(
      inputDecorationTheme:
      InputDecorationTheme(constraints: BoxConstraints(maxWidth: 300)),
    ),
    initialRoute: LoginScreen.routName,
    routes: {
      LoginScreen.routName: (context) => LoginScreen(),
      WeatherScreen.routeName: (context) => WeatherScreen(),
      UpdateCity.routeName: (context) => UpdateCity()
    },
  ));
}