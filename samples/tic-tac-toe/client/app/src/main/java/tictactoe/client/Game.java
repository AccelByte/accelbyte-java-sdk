package tictactoe.client;

public class Game {
  public enum State {
    PLAYER1_TURN,
    PLAYER2_TURN,
    PLAYER1_WINS,
    PLAYER2_WINS,
    DRAW
  }

  public String player1;

  public String player2;

  public char[][] board =
      new char[][] {
        new char[] {'1', '2', '3'},
        new char[] {'4', '5', '6'},
        new char[] {'7', '8', '9'}
      };

  public State state = State.PLAYER1_TURN;
}
