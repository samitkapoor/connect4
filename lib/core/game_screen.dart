import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:connect4/components/game_board.dart';
import 'package:connect4/components/player_turn_widget.dart';
import 'package:connect4/utils/game_logic.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class GameScreen extends StatelessWidget {
  GameScreen({super.key});

  GlobalKey<GameBoardState> gameBoardKey = GlobalKey<GameBoardState>();
  GlobalKey<PlayerTurnWidgetState> playerTurnKey =
      GlobalKey<PlayerTurnWidgetState>();

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
            onPressed: () {
              launchUrlString('https://en.wikipedia.org/wiki/Connect_Four');
            },
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 20),
            PlayerTurnWidget(key: playerTurnKey),
            const SizedBox(height: 50),
            Center(
                child:
                    GameBoard(key: gameBoardKey, playerTurnKey: playerTurnKey)),
          ],
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Restart game',
        child: InkWell(
          onTap: () {
            onRestart(gameBoardKey: gameBoardKey, playerTurnKey: playerTurnKey);
          },
          child: Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white10,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Restart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
