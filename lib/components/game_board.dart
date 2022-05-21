import 'package:connect4/models/coin.dart';
import 'package:flutter/material.dart';

import 'package:connect4/utils/game_logic.dart';
import 'package:connect4/components/game_coin_widget.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
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
                onTap: () {
                  if (end == false) {
                    setState(() {
                      onPlay(
                        Coin(
                          row: coin['row'] as int,
                          column: coin['column'] as int,
                          selected: false,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      );
                    });

                    Result result = didEnd();
                    //stop the game if the game has ended
                    if (result != Result.play) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            (result == Result.draw)
                                ? 'It\'s a tie!'
                                : (result == Result.player1)
                                    ? 'Player 1 Wins!'
                                    : 'Player 2 Wins!',
                          ),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Game Over'),
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
                              color: const Color(0xff01bfbf),
                            )
                          : Coin(
                              row: coin['row'] as int,
                              column: coin['column'] as int,
                              selected: true,
                              color: const Color(0xfff49880),
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
