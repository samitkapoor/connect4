import 'package:connect4/models/coin.dart';
import 'package:flutter/material.dart';

import 'package:connect4/utils/game_logic.dart';
import 'package:connect4/components/game_coin_widget.dart';

class GameBoard extends StatefulWidget {
  GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width - 20,
      width: MediaQuery.of(context).size.width - 20,
      color: Colors.black38,
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
                      print(didEnd());
                      switchPlayer();
                    });
                  } else {
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
