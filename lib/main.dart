import 'package:flutter/material.dart';

import 'package:connect4/core/game_screen.dart';

void main() {
  runApp(const Connect4());
}

class Connect4 extends StatelessWidget {
  const Connect4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff131942),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff180c17),
          centerTitle: true,
        ),
      ),
      title: 'Connect4',
      home: const GameScreen(),
    );
  }
}
