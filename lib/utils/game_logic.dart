import '../models/coin.dart';

int player = 1;

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
  }
}
