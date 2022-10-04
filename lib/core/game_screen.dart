import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:connect4/components/game_board.dart';
import 'package:connect4/components/player_turn_widget.dart';
import 'package:connect4/utils/game_logic.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class GameScreen extends StatefulWidget {
  GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GlobalKey<GameBoardState> gameBoardKey = GlobalKey<GameBoardState>();

  GlobalKey<PlayerTurnWidgetState> playerTurnKey =
      GlobalKey<PlayerTurnWidgetState>();

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0,
      title: Text(
        'Connect 4',
        style: GoogleFonts.aBeeZee(
          fontWeight: FontWeight.w600,
          fontSize: 24,
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
    );
    return Scaffold(
      appBar: appBar,
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              width: MediaQuery.of(context).size.width,
            ),
            GameBoard(
              key: gameBoardKey,
              playerTurnKey: playerTurnKey,
              gameBoardKey: gameBoardKey,
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          appBar.preferredSize.height) /
                      2 -
                  (MediaQuery.of(context).size.width - 20) / 2 -
                  50,
              child: PlayerTurnWidget(key: playerTurnKey),
            ),
          ],
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Restart game',
        child: InkWell(
          onTap: () {
            setState(() {});
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: Text("Do You Really Want To Restart ?"),
                    actions: [
                      TextButton(
                          onPressed: (() {
                            Navigator.pop(context);
                            return onRestart(
                              gameBoardKey: gameBoardKey,
                              playerTurnKey: playerTurnKey,
                              context: context,
                            );
                          }),
                          child: Text("Yes"))
                    ],
                  );
                });
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
