package net.accelbyte.sdk.core.client;

import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;

public class DefaultHttpRetryPolicy implements HttpRetryPolicy {

  public enum RetryIntervalType {
    LINEAR,
    EXPONENTIAL
  }

  @Getter @Setter private int callTimeout = 3000; // Millis

  @Getter @Setter private int maxRetry = 3; // Count

  @Getter @Setter private int retryInterval = 2000; // Millis

  @Getter @Setter private RetryIntervalType retryIntervalType = RetryIntervalType.LINEAR;

  @Override
  public boolean doRetry(
      int attempt, Operation operation, HttpResponse response, Exception exception) {
    if (attempt < maxRetry) {
      // Retry on server error or exception
      if ((response != null && response.getCode() >= 500) || exception != null) {
        try {
          final int multiplier = retryIntervalType == RetryIntervalType.EXPONENTIAL ? attempt : 1;
          Thread.sleep(retryInterval * multiplier); // Wait before retry
        } catch (InterruptedException ie) {
          Thread.currentThread().interrupt();
        }

        return true;
      }
    }

    return false;
  }
}
