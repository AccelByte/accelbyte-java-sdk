/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import java.util.HashMap;

public class HttpHeaders extends HashMap<String, String> {
  public static final String AUTHORIZATION = "Authorization";
  public static final String CONTENT_TYPE = "Content-Type";
  public static final String USER_AGENT = "User-Agent";
  public static final String COOKIE = "Cookie";

  public static final String X_AMZN_TRACE_ID = "X-Amzn-Trace-Id";
}
