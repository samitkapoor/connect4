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
    return Text(
      'Turn: Player $player',
      style: GoogleFonts.openSans(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }
}
