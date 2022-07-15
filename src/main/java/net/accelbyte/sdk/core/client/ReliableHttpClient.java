package net.accelbyte.sdk.core.client;

import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpHeaders;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;

public class ReliableHttpClient extends OkhttpClient {

  @Getter @Setter private HttpRetryPolicy httpRetryPolicy;

  public ReliableHttpClient(HttpRetryPolicy policy) {
    this.httpRetryPolicy = policy;
  }

  @Override
  public HttpResponse sendRequest(Operation operation, String baseURL, HttpHeaders headers)
      throws Exception {
    int attempt = 1;
    while (true) {
      HttpResponse response = null;
      Exception exception = null;

      try {
        response = super.sendRequest(operation, baseURL, headers, httpRetryPolicy.getCallTimeout());
      } catch (Exception ex) {
        exception = ex;
      }

      if (httpRetryPolicy != null) {
        if (httpRetryPolicy.doRetry(attempt, operation, response, exception)) {
          attempt++;
          continue;
        }
      }

      if (exception != null) {
        throw exception;
      }

      return response;
    }
  }
}
