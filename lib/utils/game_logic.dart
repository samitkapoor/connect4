import '../models/coin.dart';

int player = 1;
int turns = 0;
bool end = false;

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

void onPlay(Coin coin) {
  int column = coin.column;
  int i = 6;

  while (i >= 0 && gameState[i][column]['value'] != 0) {
    i--;
  }

  if (i >= 0) {
    gameState[i][column]['value'] = player;
    turns++;
  }
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
        if (gameState[i][j]['value'] == 1) {
          end = true;
          return Result.player1;
        } else {
          end = true;
          return Result.player2;
        }
      }

      //right
      else if (j >= 0 &&
          j <= 3 &&
          gameState[i][j]['value'] == gameState[i][j + 1]['value'] &&
          gameState[i][j + 1]['value'] == gameState[i][j + 2]['value'] &&
          gameState[i][j + 2]['value'] == gameState[i][j + 3]['value']) {
        if (gameState[i][j]['value'] == 1) {
          end = true;
          return Result.player1;
        } else {
          end = true;
          return Result.player2;
        }
      }

      //up
      else if (i >= 3 &&
          i <= 6 &&
          gameState[i][j]['value'] == gameState[i - 1][j]['value'] &&
          gameState[i - 1][j]['value'] == gameState[i - 2][j]['value'] &&
          gameState[i - 2][j]['value'] == gameState[i - 3][j]['value']) {
        if (gameState[i][j]['value'] == 1) {
          end = true;
          return Result.player1;
        } else {
          end = true;
          return Result.player2;
        }
      }

      //down
      else if (i >= 0 &&
          i <= 3 &&
          gameState[i][j]['value'] == gameState[i + 1][j]['value'] &&
          gameState[i + 1][j]['value'] == gameState[i + 2][j]['value'] &&
          gameState[i + 2][j]['value'] == gameState[i + 3][j]['value']) {
        if (gameState[i][j]['value'] == 1) {
          end = true;
          return Result.player1;
        } else {
          end = true;
          return Result.player2;
        }
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
        if (gameState[i][j]['value'] == 1) {
          end = true;
          return Result.player1;
        } else {
          end = true;
          return Result.player2;
        }
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
        if (gameState[i][j]['value'] == 1) {
          end = true;
          return Result.player1;
        } else {
          end = true;
          return Result.player2;
        }
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
        if (gameState[i][j]['value'] == 1) {
          end = true;
          return Result.player1;
        } else {
          end = true;
          return Result.player2;
        }
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
        if (gameState[i][j]['value'] == 1) {
          end = true;
          return Result.player1;
        } else {
          end = true;
          return Result.player2;
        }
      }
    }
  }

  return Result.play;
}
