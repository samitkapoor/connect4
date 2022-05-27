import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:connect4/utils/game_logic.dart';

class PlayerTurnWidget extends StatefulWidget {
  const PlayerTurnWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerTurnWidget> createState() => PlayerTurnWidgetState();
}

class PlayerTurnWidgetState extends State<PlayerTurnWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          buildColorBox(selectedPlayer: player, selected: player == 1),
          const SizedBox(width: 10),
          buildText(text: 'Player 1'),
          const Spacer(),
          buildColorBox(selectedPlayer: player, selected: player == 2),
          const SizedBox(width: 10),
          buildText(text: 'Player 2'),
        ],
      ),
    );
  }

  Container buildColorBox(
      {required bool selected, required int selectedPlayer}) {
    return Container(
      height: 20,
      width: 20,
      color: !selected
          ? Colors.black
          : (selectedPlayer == 1)
              ? playerOneColor
              : playerTwoColor,
    );
  }

  Text buildText({required String text}) {
    return Text(
      text,
      style: GoogleFonts.besley(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      textAlign: TextAlign.center,
    );
  }
}
