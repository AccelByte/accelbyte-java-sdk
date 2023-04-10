/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.generateUUID;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UnblockPlayerResponse {
  private Integer code;
  private String id;
  private String namespace;
  private String unblockedUserId;

  private UnblockPlayerResponse() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UnblockPlayerResponse(Integer code, String id, String namespace, String unblockedUserId) {
    this.code = code;
    this.id = id;
    this.namespace = namespace;
    this.unblockedUserId = unblockedUserId;
  }

  public static String getType() {
    return "unblockPlayerResponse";
  }

  public static UnblockPlayerResponse createFromWSM(String message) {
    UnblockPlayerResponse result = new UnblockPlayerResponse();
    Map<String, String> response = parseWSM(message);
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
    result.unblockedUserId =
        response.get("unblockedUserId") != null ? response.get("unblockedUserId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(UnblockPlayerResponse.getType());
    if (code != null) {
      stringBuilder.append("\n").append("code: ").append(code);
    }
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    if (namespace != null) {
      stringBuilder.append("\n").append("namespace: ").append(namespace);
    }
    if (unblockedUserId != null) {
      stringBuilder.append("\n").append("unblockedUserId: ").append(unblockedUserId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("code", "code");
    result.put("id", "id");
    result.put("namespace", "namespace");
    result.put("unblockedUserId", "unblockedUserId");
    return result;
  }
}
