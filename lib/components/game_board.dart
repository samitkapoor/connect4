import 'package:connect4/models/coin.dart';
import 'package:flutter/material.dart';

import 'package:connect4/utils/game_logic.dart';
import 'package:connect4/components/game_coin_widget.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class GameBoard extends StatefulWidget {
  GameBoard(
      {super.key, required this.playerTurnKey, required this.gameBoardKey});
  GlobalKey gameBoardKey;
  GlobalKey playerTurnKey;

  @override
  State<GameBoard> createState() => GameBoardState();
}

class GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width - 20,
      width: MediaQuery.of(context).size.width - 20,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: gameState.map((row) {
          return Row(
            children: row.map((coin) {
              return InkWell(
                onTap: () async {
                  if (end == false) {
                    await onPlay(
                        coin: Coin(
                          row: coin['row'] as int,
                          column: coin['column'] as int,
                          selected: false,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        playerTurnKey: widget.playerTurnKey,
                        gameBoardKey: widget.gameBoardKey);

                    Result result = didEnd();
                    //stop the game if the game has ended
                    if (result != Result.play) {
                      setState(() {});
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white.withOpacity(0.9),
                            content: Text(
                              (result == Result.draw)
                                  ? 'It\'s a tie'
                                  : (result == Result.player1)
                                      ? 'Player 1 wins'
                                      : 'Player 2 wins',
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                              ),
                            ),
                            title: Text(
                              'GAME OVER!',
                              style: GoogleFonts.chelseaMarket(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Game Over!',
                          style: GoogleFonts.chelseaMarket(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: GameCoinWidget(
                  coin: (coin['value'] == 0)
                      ? Coin(
                          row: coin['row'] as int,
                          column: coin['column'] as int,
                          selected: false,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        )
                      : (coin['value'] == 1)
                          ? Coin(
                              row: coin['row'] as int,
                              column: coin['column'] as int,
                              selected: true,
                              color: const Color(0xffffa69e),
                            )
                          : (coin['value'] == 2)
                              ? Coin(
                                  row: coin['row'] as int,
                                  column: coin['column'] as int,
                                  selected: true,
                                  color: const Color(0xffb6eea6),
                                )
                              : Coin(
                                  row: coin['row'] as int,
                                  column: coin['column'] as int,
                                  selected: true,
                                  color: Colors.red,
                                ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
