/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import java.util.HashMap;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MockServerResponseConfiguration {
  private boolean enabled;
  private boolean overwrite;
  private int delay; // Seconds
  private int status; // HTTP status code
  private Object response;
  private HashMap<String, String> headers;
}
