package tictactoe.client;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.concurrent.TimeUnit;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpWebSocketClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import org.jetbrains.annotations.NotNull;

public class App {

  public static void main(String[] args) throws Exception {
    OkhttpWebSocketClient ws = null;

    try {
      final String lambdaUrl = System.getenv("LAMBDA_URL"); // e.g. http://localhost:3000/tictactoe
      final int readTimeoutSeconds = 60; // Give enough time to complete API calls
      final OkHttpClient lambdaClient =
          new OkHttpClient().newBuilder().readTimeout(readTimeoutSeconds, TimeUnit.SECONDS).build();

      final ResettableCountDownLatch updateSignal = new ResettableCountDownLatch();

      // Create SDK instance

      AccelByteSDK sdk =
          new AccelByteSDK(
              new net.accelbyte.sdk.core.client.OkhttpClient(),
              new DefaultTokenRepository(),
              new DefaultConfigRepository());

      // Login  user

      System.out.print("Username: ");
      final String username = System.console().readLine();
      System.out.print("Password: ");
      final String password = String.valueOf(System.console().readPassword());

      final boolean isLoginOk = sdk.loginUser(username, password);

      if (!isLoginOk) {
        System.out.println("Login user failed!");
        System.exit(1); // Login failed
      }

      final String userAccessToken = sdk.getSdkConfiguration().getTokenRepository().getToken();

      // Connect to lobby websocket to get notification from lambda

      ws =
          OkhttpWebSocketClient.create(
              sdk.getSdkConfiguration().getConfigRepository(),
              sdk.getSdkConfiguration().getTokenRepository(),
              new WebSocketListener() {
                @Override
                public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
                  if (text != null
                      && (text.contains("GAME START") || text.contains("BOARD UPDATE"))) {
                    updateSignal.countDown();
                  }
                }
              });

      System.out.println("Press Ctrl+C to exit");

      // Start game

      int player = 0;

      while (true) {
        final Request startRequest =
            new Request.Builder()
                .url(lambdaUrl + "/start")
                .addHeader("Authorization", String.format("Bearer %s", userAccessToken))
                .post(RequestBody.create("{}", MediaType.parse("application/json")))
                .build();

        try (Response lambdaResponse = lambdaClient.newCall(startRequest).execute()) {
          if (lambdaResponse.isSuccessful()) {
            final String body = lambdaResponse.body().string();
            player =
                body.contains("ok - player 1") ? 1 : 2; // Set whether user is player 1 or player 2
            break; // Stop here and proceed to play game
          }
        }

        // Starting game may fail because of existing game, try to clear it first

        System.out.print("Existing game found, press ENTER to clear it ... ");
        System.console().readPassword();

        final Request resetRequest =
            new Request.Builder()
                .url(lambdaUrl + "/reset")
                .addHeader("Authorization", String.format("Bearer %s", userAccessToken))
                .post(RequestBody.create("{}", MediaType.parse("application/json")))
                .build();

        try (Response lambdaResponse = lambdaClient.newCall(resetRequest).execute()) {
          if (!lambdaResponse.isSuccessful()) {
            System.out.println(lambdaResponse.body().string());
            System.exit(1); // Reset failed
          }
        }
      }

      if (player == 1) {
        System.out.println("Waiting for player 2");
      } else {
        System.out.println("Player 1 moves first");
      }

      // Play game

      while (true) {
        System.out.println();

        updateSignal.await();
        updateSignal.Reset();

        final Request stateRequest =
            new Request.Builder()
                .url(lambdaUrl + "/state")
                .addHeader("Authorization", String.format("Bearer %s", userAccessToken))
                .get()
                .build();

        String gameJson = null;

        try (Response lambdaResponse = lambdaClient.newCall(stateRequest).execute()) {
          if (lambdaResponse.isSuccessful()) {
            gameJson = lambdaResponse.body().string();
          } else {
            System.out.println(lambdaResponse.body().string());
            System.exit(1); // Cannot get state
          }
        }

        final ObjectMapper mapper = new ObjectMapper();
        final Game game = mapper.readValue(gameJson, Game.class);

        // Print board

        printBoard(game.board);
        System.out.println();

        if (game.state == Game.State.PLAYER1_TURN || game.state == Game.State.PLAYER2_TURN) {
          // Make move

          if ((game.state == Game.State.PLAYER1_TURN && player == 1)
              || (game.state == Game.State.PLAYER2_TURN && player == 2)) {
            while (true) {
              System.out.print(String.format("Your move (%s): ", player == 1 ? 'X' : 'O'));
              final String moveIndex = System.console().readLine();
              final Request moveRequest =
                  new Request.Builder()
                      .url(lambdaUrl + "/move")
                      .addHeader("Authorization", String.format("Bearer %s", userAccessToken))
                      .post(
                          RequestBody.create(
                              String.format("{\"move\" : \"%s\"}", moveIndex),
                              MediaType.parse("application/json")))
                      .build();
              try (Response lambdaResponse = lambdaClient.newCall(moveRequest).execute()) {
                if (!lambdaResponse.isSuccessful()) {
                  System.out.println("Wrong move?");
                  continue;
                }
              }
              break;
            }
          } else {
            System.out.println("Waiting for response");
          }
        } else if (game.state == Game.State.PLAYER1_WINS || game.state == Game.State.PLAYER2_WINS) {
          // Win or lose

          if ((game.state == Game.State.PLAYER1_WINS && player == 1)
              || (game.state == Game.State.PLAYER2_WINS && player == 2)) {
            System.out.println("You win");
          } else {
            System.out.println("You lose");
          }
          break;
        } else if (game.state == Game.State.DRAW) {
          // Draw

          System.out.println("Draw");
          break;
        }
      }

      System.exit(0);
    } finally {
      if (ws != null) {
        ws.close(1000, "normal close");
      }
    }

    System.exit(1);
  }

  private static void printBoard(char[][] board) {
    final int n = board.length;
    for (int r = 0; r < n; r++) {
      System.out.println("+―――+―――+―――+");
      for (int c = 0; c < n; c++) {
        System.out.print(String.format("| %s ", board[r][c]));
      }
      System.out.println("|");
    }
    System.out.println("+―――+―――+―――+");
  }
}
