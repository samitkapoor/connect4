import 'package:flutter/material.dart';

import 'package:connect4/models/coin.dart';

class GameCoinWidget extends StatelessWidget {
  GameCoinWidget({super.key, required this.coin});

  Coin coin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width - 20) / 7,
      width: (MediaQuery.of(context).size.width - 20) / 7,
      color: Theme.of(context).appBarTheme.backgroundColor,
      alignment: Alignment.center,
      child: Container(
        height: (MediaQuery.of(context).size.width - 20) / 7,
        width: (MediaQuery.of(context).size.width - 20) / 7,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: coin.color,
        ),
      ),
    );
  }
}
