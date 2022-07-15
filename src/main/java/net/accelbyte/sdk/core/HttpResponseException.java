/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HttpResponseException extends Exception {
  private final int httpCode;
  private final String errorMessage;

  public HttpResponseException(int httpStatusCode, String errorMessage) {
    super(errorMessage);
    this.httpCode = httpStatusCode;
    this.errorMessage = errorMessage;
  }
}
