/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.client;

import net.accelbyte.sdk.core.HttpHeaders;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.logging.HttpLogger;

public interface HttpClient<T extends HttpLogger<?, ?>> {
  HttpResponse sendRequest(Operation operation, String baseURL, HttpHeaders headers)
      throws Exception;

  void setLogger(T logger);
}
