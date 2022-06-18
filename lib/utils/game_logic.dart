import 'package:flutter/material.dart';

import 'package:connect4/models/coin.dart';

Color playerOneColor = const Color(0xffffa69e);

Color playerTwoColor = const Color(0xffb6eea6);

//player = 1 if it's player 1's turn to play and 2 if it's player 2's turn to play
int player = 1;
//count the number of turns
int turns = 0;
//end will be true if the game has ended
bool end = false;

//play means the game hasn't ended yet
//draw means the game is over and no one has won the game
//player1 means the game was won by player1
//player2 means the game was won by player2
enum Result { play, draw, player1, player2 }

List<List<Map<String, int>>> gameState = [
  [
    {'row': 0, 'column': 0, 'value': 0},
    {'row': 0, 'column': 1, 'value': 0},
    {'row': 0, 'column': 2, 'value': 0},
    {'row': 0, 'column': 3, 'value': 0},
    {'row': 0, 'column': 4, 'value': 0},
    {'row': 0, 'column': 5, 'value': 0},
    {'row': 0, 'column': 6, 'value': 0},
  ],
  [
    {'row': 1, 'column': 0, 'value': 0},
    {'row': 1, 'column': 1, 'value': 0},
    {'row': 1, 'column': 2, 'value': 0},
    {'row': 1, 'column': 3, 'value': 0},
    {'row': 1, 'column': 4, 'value': 0},
    {'row': 1, 'column': 5, 'value': 0},
    {'row': 1, 'column': 6, 'value': 0},
  ],
  [
    {'row': 2, 'column': 0, 'value': 0},
    {'row': 2, 'column': 1, 'value': 0},
    {'row': 2, 'column': 2, 'value': 0},
    {'row': 2, 'column': 3, 'value': 0},
    {'row': 2, 'column': 4, 'value': 0},
    {'row': 2, 'column': 5, 'value': 0},
    {'row': 2, 'column': 6, 'value': 0},
  ],
  [
    {'row': 3, 'column': 0, 'value': 0},
    {'row': 3, 'column': 1, 'value': 0},
    {'row': 3, 'column': 2, 'value': 0},
    {'row': 3, 'column': 3, 'value': 0},
    {'row': 3, 'column': 4, 'value': 0},
    {'row': 3, 'column': 5, 'value': 0},
    {'row': 3, 'column': 6, 'value': 0},
  ],
  [
    {'row': 4, 'column': 0, 'value': 0},
    {'row': 4, 'column': 1, 'value': 0},
    {'row': 4, 'column': 2, 'value': 0},
    {'row': 4, 'column': 3, 'value': 0},
    {'row': 4, 'column': 4, 'value': 0},
    {'row': 4, 'column': 5, 'value': 0},
    {'row': 4, 'column': 6, 'value': 0},
  ],
  [
    {'row': 5, 'column': 0, 'value': 0},
    {'row': 5, 'column': 1, 'value': 0},
    {'row': 5, 'column': 2, 'value': 0},
    {'row': 5, 'column': 3, 'value': 0},
    {'row': 5, 'column': 4, 'value': 0},
    {'row': 5, 'column': 5, 'value': 0},
    {'row': 5, 'column': 6, 'value': 0},
  ],
  [
    {'row': 6, 'column': 0, 'value': 0},
    {'row': 6, 'column': 1, 'value': 0},
    {'row': 6, 'column': 2, 'value': 0},
    {'row': 6, 'column': 3, 'value': 0},
    {'row': 6, 'column': 4, 'value': 0},
    {'row': 6, 'column': 5, 'value': 0},
    {'row': 6, 'column': 6, 'value': 0},
  ],
];

void switchPlayer() {
  player = (player == 1) ? 2 : 1;
}

Future<void> playAnimation(
    {required int row,
    required int col,
    required GlobalKey gameBoardKey,
    required int player}) async {
  //play the coin dropping animation till row - 1 slot
  print(row);
  int i = 0;
  while (i < row) {
    gameState[i][col]['value'] = player;
    // ignore: invalid_use_of_protected_member
    gameBoardKey.currentState!.setState(() {});
    await Future.delayed(const Duration(milliseconds: 20)).then((val) {
      gameState[i][col]['value'] = 0;
      // ignore: invalid_use_of_protected_member
      gameBoardKey.currentState!.setState(() {});
      i++;
    });
  }

  //the bounce effect
  if (row >= 2) {
    i = row;
    while (i >= row - 2) {
      gameState[i][col]['value'] = player;
      // ignore: invalid_use_of_protected_member
      gameBoardKey.currentState!.setState(() {});
      await Future.delayed(const Duration(milliseconds: 30)).then((val) {
        gameState[i][col]['value'] = 0;
        // ignore: invalid_use_of_protected_member
        gameBoardKey.currentState!.setState(() {});
      });
      i--;
    }
    i += 2;
    gameState[i][col]['value'] = player;
    // ignore: invalid_use_of_protected_member
    gameBoardKey.currentState!.setState(() {});
    await Future.delayed(const Duration(milliseconds: 20)).then((val) {
      gameState[i][col]['value'] = 0;
      // ignore: invalid_use_of_protected_member
      gameBoardKey.currentState!.setState(() {});
    });
  }

  return Future.value();
}

Future<void> onPlay(
    {required Coin coin,
    required GlobalKey playerTurnKey,
    required GlobalKey gameBoardKey}) async {
  int column = coin.column;
  int i = 6;

  //get the topmost position where we the coin will be dropped into
  while (i >= 0 && gameState[i][column]['value'] != 0) {
    i--;
  }

  //if i < 0 that means that the column is full and no coin can be inserted in that column
  if (i >= 0) {
    await playAnimation(
      row: i,
      col: column,
      gameBoardKey: gameBoardKey,
      player: player,
    );

    gameState[i][column]['value'] = player;
    turns++;
    switchPlayer();
  }

  // ignore: invalid_use_of_protected_member
  gameBoardKey.currentState!.setState(() {});
  // ignore: invalid_use_of_protected_member
  playerTurnKey.currentState!.setState(() {});

  return Future.value();
}

Result didEnd() {
  if (turns == 49) {
    end = true;
    return Result.draw;
  }

  for (int i = 0; i < gameState.length; i++) {
    for (int j = 0; j < gameState[i].length; j++) {
      //left
      if (gameState[i][j]['value'] == 0) continue;
      if (j >= 3 &&
          j <= 6 &&
          gameState[i][j]['value'] == gameState[i][j - 1]['value'] &&
          gameState[i][j - 1]['value'] == gameState[i][j - 2]['value'] &&
          gameState[i][j - 2]['value'] == gameState[i][j - 3]['value']) {
        Result result;
        if (gameState[i][j]['value'] == 1) {
          end = true;
          result = Result.player1;
        } else {
          end = true;
          result = Result.player2;
        }
        gameState[i][j]['value'] = gameState[i][j - 1]['value'] =
            gameState[i][j - 2]['value'] = gameState[i][j - 3]['value'] = 3;
        return result;
      }

      //right
      else if (j >= 0 &&
          j <= 3 &&
          gameState[i][j]['value'] == gameState[i][j + 1]['value'] &&
          gameState[i][j + 1]['value'] == gameState[i][j + 2]['value'] &&
          gameState[i][j + 2]['value'] == gameState[i][j + 3]['value']) {
        Result result;
        if (gameState[i][j]['value'] == 1) {
          end = true;
          result = Result.player1;
        } else {
          end = true;
          result = Result.player2;
        }
        gameState[i][j]['value'] = gameState[i][j + 1]['value'] =
            gameState[i][j + 2]['value'] = gameState[i][j + 3]['value'] = 3;
        return result;
      }

      //up
      else if (i >= 3 &&
          i <= 6 &&
          gameState[i][j]['value'] == gameState[i - 1][j]['value'] &&
          gameState[i - 1][j]['value'] == gameState[i - 2][j]['value'] &&
          gameState[i - 2][j]['value'] == gameState[i - 3][j]['value']) {
        Result result;
        if (gameState[i][j]['value'] == 1) {
          end = true;
          result = Result.player1;
        } else {
          end = true;
          result = Result.player2;
        }
        gameState[i][j]['value'] = gameState[i - 1][j]['value'] =
            gameState[i - 2][j]['value'] = gameState[i - 3][j]['value'] = 3;
        return result;
      }

      //down
      else if (i >= 0 &&
          i <= 3 &&
          gameState[i][j]['value'] == gameState[i + 1][j]['value'] &&
          gameState[i + 1][j]['value'] == gameState[i + 2][j]['value'] &&
          gameState[i + 2][j]['value'] == gameState[i + 3][j]['value']) {
        Result result;
        if (gameState[i][j]['value'] == 1) {
          end = true;
          result = Result.player1;
        } else {
          end = true;
          result = Result.player2;
        }
        gameState[i][j]['value'] = gameState[i + 1][j]['value'] =
            gameState[i + 2][j]['value'] = gameState[i + 3][j]['value'] = 3;
        return result;
      }

      //up-left
      else if (i >= 3 &&
          j >= 3 &&
          i <= 6 &&
          j <= 6 &&
          gameState[i][j]['value'] == gameState[i - 1][j - 1]['value'] &&
          gameState[i - 1][j - 1]['value'] ==
              gameState[i - 2][j - 2]['value'] &&
          gameState[i - 2][j - 2]['value'] ==
              gameState[i - 3][j - 3]['value']) {
        Result result;
        if (gameState[i][j]['value'] == 1) {
          end = true;
          result = Result.player1;
        } else {
          end = true;
          result = Result.player2;
        }
        gameState[i][j]['value'] = gameState[i - 1][j - 1]['value'] =
            gameState[i - 2][j - 2]['value'] =
                gameState[i - 3][j - 3]['value'] = 3;
        return result;
      }

      //up-right
      else if (i >= 3 &&
          j >= 0 &&
          i <= 6 &&
          j <= 3 &&
          gameState[i][j]['value'] == gameState[i - 1][j + 1]['value'] &&
          gameState[i - 1][j + 1]['value'] ==
              gameState[i - 2][j + 2]['value'] &&
          gameState[i - 2][j + 2]['value'] ==
              gameState[i - 3][j + 3]['value']) {
        Result result;
        if (gameState[i][j]['value'] == 1) {
          end = true;
          result = Result.player1;
        } else {
          end = true;
          result = Result.player2;
        }
        gameState[i][j]['value'] = gameState[i - 1][j + 1]['value'] =
            gameState[i - 2][j + 2]['value'] =
                gameState[i - 3][j + 3]['value'] = 3;
        return result;
      }

      //down-right
      else if (i >= 0 &&
          i <= 3 &&
          j >= 0 &&
          j <= 3 &&
          gameState[i][j]['value'] == gameState[i + 1][j + 1]['value'] &&
          gameState[i + 1][j + 1]['value'] ==
              gameState[i + 2][j + 2]['value'] &&
          gameState[i + 2][j + 2]['value'] ==
              gameState[i + 3][j + 3]['value']) {
        Result result;
        if (gameState[i][j]['value'] == 1) {
          end = true;
          result = Result.player1;
        } else {
          end = true;
          result = Result.player2;
        }
        gameState[i][j]['value'] = gameState[i + 1][j + 1]['value'] =
            gameState[i + 2][j + 2]['value'] =
                gameState[i + 3][j + 3]['value'] = 3;
        return result;
      }

      //down-left
      else if (i >= 0 &&
          i <= 3 &&
          j >= 3 &&
          j <= 6 &&
          gameState[i][j]['value'] == gameState[i + 1][j - 1]['value'] &&
          gameState[i + 1][j - 1]['value'] ==
              gameState[i + 2][j - 2]['value'] &&
          gameState[i + 2][j - 2]['value'] ==
              gameState[i + 3][j - 3]['value']) {
        Result result;
        if (gameState[i][j]['value'] == 1) {
          end = true;
          result = Result.player1;
        } else {
          end = true;
          result = Result.player2;
        }
        gameState[i][j]['value'] = gameState[i + 1][j - 1]['value'] =
            gameState[i + 2][j - 2]['value'] =
                gameState[i + 3][j - 3]['value'] = 3;
        return result;
      }
    }
  }

  //if the control flow reaches here that means the game hasn't ended yet!
  return Result.play;
}

void onRestart(
    {required GlobalKey gameBoardKey,
    required GlobalKey playerTurnKey,
    required BuildContext context}) {
  turns = 0;
  player = 1;
  end = false;

  for (int i = 0; i < gameState.length; i++) {
    for (int j = 0; j < gameState.length; j++) {
      gameState[i][j]['value'] = 0;
    }
  }
  ScaffoldMessenger.of(context).clearSnackBars();
  // ignore: invalid_use_of_protected_member
  gameBoardKey.currentState!.setState(() {});
  // ignore: invalid_use_of_protected_member
  playerTurnKey.currentState!.setState(() {});
}
