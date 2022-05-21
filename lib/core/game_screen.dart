import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:connect4/components/game_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Connect 4',
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'How to play?',
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).appBarTheme.backgroundColor as Color,
            ],
            stops: const [0.45, 1],
          ),
        ),
        alignment: Alignment.center,
        child: GameBoard(),
      ),
    );
  }
}
