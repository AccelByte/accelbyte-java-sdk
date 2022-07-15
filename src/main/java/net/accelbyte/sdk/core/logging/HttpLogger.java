/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.logging;

public interface HttpLogger<T, U> {
  void logRequest(T request);

  void logResponse(U response);
}
