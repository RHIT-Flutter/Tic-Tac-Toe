import 'package:flutter/material.dart';

class TicTacToeModel {
  static const NUM_ROWS = 3;
  static const NUM_COLS = 3;

  static const MARK_NONE = " ";
  static const MARK_X = "X";
  static const MARK_O = "O";

  static const X_TURN = "X's Turn";
  static const O_TURN = "O's Turn";
  static const X_WINS = "X Wins!";
  static const O_WINS = "O Wins!";
  static const TIE_GAME = "Tie Game!";

  var board;
  var gameState = X_TURN;

  TicTacToeModel() {
    this.reset();
  }

  void reset() {
    this.board = List.generate(NUM_ROWS,
            (index) => List.filled(NUM_COLS + 1, MARK_NONE, growable: false), growable: false);
    this.gameState = X_TURN;
  }

  String stringForButton(int row, int col){
    return this.board[row][col];
  }

  void pressButtonAt(int row, int col) {
    String mark = this.board[row][col];

    if(mark.compareTo(MARK_NONE) != 0) {
      return;
    }

    if(gameState.compareTo(X_TURN) == 0) {
      board[row][col] = MARK_X;
      gameState = O_TURN;
      checkForWin();
    } else if(gameState.compareTo(O_TURN) == 0) {
      board[row][col] = MARK_O;
      gameState = X_TURN;
      checkForWin();
    }
  }

  void checkForWin() {
    if(gameState.compareTo(X_TURN) != 0 && gameState.compareTo(O_TURN) != 0) {
      return;
    }

    if(didPieceWin(MARK_X)) {
      gameState = X_WINS;
    } else if(didPieceWin(MARK_O)) {
      gameState = O_WINS;
    } else if(isBoardFull()) {
      gameState = TIE_GAME;
    }
  }

  bool didPieceWin(String mark) {
    return didPieceWinAcross(mark) || 
        didPieceWinDown(mark) ||
        didPieceWinMainDiagonal(mark) ||
        didPieceWinOffDiagonal(mark);
  }

  bool didPieceWinAcross(String mark) {
    for(int row = 0; row < NUM_ROWS; row++) {
      var winHere = true;
      for(int col = 0; col < NUM_COLS; col++) {
        if(stringForButton(row, col).compareTo(mark) != 0) {
          winHere = false;
        }
      }
      if(winHere) {
        return true;
      }
    }
    return false;
  }

  bool didPieceWinDown(String mark) {
    for(int col = 0; col < NUM_COLS; col++) {
      var winHere = true;
      for(int row = 0; row < NUM_ROWS; row++) {
        if(stringForButton(row, col).compareTo(mark) != 0) {
          winHere = false;
        }
      }
      if(winHere) {
        return true;
      }
    }
    return false;
  }

  bool didPieceWinMainDiagonal(String mark) {
    var winHere = true;
    for(int row = 0; row < NUM_ROWS; row++) {
      if(stringForButton(row, row).compareTo(mark) != 0) {
        winHere = false;
      }
    }
    return winHere;
  }

  bool didPieceWinOffDiagonal(String mark) {
    var winHere = true;
    for(int row = 0; row < NUM_ROWS; row++) {
      if(stringForButton(row, 2 - row).compareTo(mark) != 0) {
        winHere = false;
      }
    }
    return winHere;
  }

  bool isBoardFull() {
    for(var row = 0; row < NUM_ROWS; row++) {
      for(var col = 0; col < NUM_COLS; col++) {
        String mark = board[row][col];
        if(mark.compareTo(MARK_NONE) == 0) {
          return false;
        }
      }
    }
    return true;
  }

}

