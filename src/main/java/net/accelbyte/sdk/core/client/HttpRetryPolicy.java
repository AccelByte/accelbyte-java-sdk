package net.accelbyte.sdk.core.client;

import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;

public interface HttpRetryPolicy {
  int getCallTimeout();

  boolean doRetry(int attempt, Operation operation, HttpResponse response, Exception exception);
}
