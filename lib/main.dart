import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/main_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              centerTitle: true,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        home: MainMenu());
  }
}
