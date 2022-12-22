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
public class ExitAllChannel {
  private String namespace;
  private String userId;

  private ExitAllChannel() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ExitAllChannel(String namespace, String userId) {
    this.namespace = namespace;
    this.userId = userId;
  }

  public static String getType() {
    return "exitAllChannel";
  }

  public static ExitAllChannel createFromWSM(String message) {
    ExitAllChannel result = new ExitAllChannel();
    Map<String, String> response = parseWSM(message);
    result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
    result.userId = response.get("userId") != null ? response.get("userId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(ExitAllChannel.getType());
    if (namespace != null) {
      stringBuilder.append("\n").append("namespace: ").append(namespace);
    }
    if (userId != null) {
      stringBuilder.append("\n").append("userId: ").append(userId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("namespace", "namespace");
    result.put("userId", "userId");
    return result;
  }
}
