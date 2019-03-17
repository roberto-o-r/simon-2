import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simon_2/screens/game/test_screen.dart';
import 'package:simon_2/screens/home/home_screen.dart';

class Simon2App extends StatefulWidget {
  _SimonAppState createState() => _SimonAppState();
}

class _SimonAppState extends State<Simon2App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      theme: ThemeData(),
      routes: {
        '/': (context) => HomeScreen(),
        '/game': (context) => TestScreen()
      },
    );
  }
}
