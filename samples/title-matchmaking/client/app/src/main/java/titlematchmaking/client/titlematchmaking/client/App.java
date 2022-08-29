package titlematchmaking.client;

import java.util.concurrent.CountDownLatch;
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

      final CountDownLatch doneSignal = new CountDownLatch(1);

      Runtime.getRuntime()
          .addShutdownHook(
              new Thread() {
                @Override
                public void run() {
                  doneSignal.countDown();
                }
              });

      System.out.println("---");
      System.out.println("Press Ctrl+C to exit");

      // Connect to lobby websocket and print out any messages received

      ws =
          OkhttpWebSocketClient.create(
              sdk.getSdkConfiguration().getConfigRepository(),
              sdk.getSdkConfiguration().getTokenRepository(),
              new WebSocketListener() {
                @Override
                public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
                  System.out.println("---");
                  System.out.println(text);
                }
              });

      // Request matchmaking to our lambda

      final String lambdaUrl =
          System.getenv("LAMBDA_URL"); // e.g. http://localhost:3000/title-matchmaking
      final String userAccessToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
      final int readTimeoutSeconds = 90; // Give enough time to complete claim server process

      final Request lambdaRequest =
          new Request.Builder()
              .url(lambdaUrl)
              .addHeader("Authorization", String.format("Bearer %s", userAccessToken))
              .post(RequestBody.create("{}", MediaType.parse("application/json")))
              .build();

      final OkHttpClient lambdaClient =
          new OkHttpClient().newBuilder().readTimeout(readTimeoutSeconds, TimeUnit.SECONDS).build();

      try (Response lambdaResponse = lambdaClient.newCall(lambdaRequest).execute()) {
        if (!lambdaResponse.isSuccessful()) {
          System.out.println(lambdaResponse.body().string());
        }
      }

      doneSignal.await();

      System.exit(0);
    } finally {
      if (ws != null) {
        ws.close(1000, "normal close");
      }
    }

    System.exit(1);
  }
}
