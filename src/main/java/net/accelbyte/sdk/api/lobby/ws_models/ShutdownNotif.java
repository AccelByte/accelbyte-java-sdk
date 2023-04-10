/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShutdownNotif {
  private String message;

  private ShutdownNotif() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ShutdownNotif(String message) {
    this.message = message;
  }

  public static String getType() {
    return "shutdownNotif";
  }

  public static ShutdownNotif createFromWSM(String message) {
    ShutdownNotif result = new ShutdownNotif();
    Map<String, String> response = parseWSM(message);
    result.message = response.get("message") != null ? response.get("message") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(ShutdownNotif.getType());
    if (message != null) {
      stringBuilder.append("\n").append("message: ").append(message);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("message", "message");
    return result;
  }
}
