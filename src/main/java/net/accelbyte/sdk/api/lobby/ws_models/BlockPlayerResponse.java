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
public class BlockPlayerResponse {
  private String blockUserId;
  private Integer code;
  private String id;
  private String namespace;

  private BlockPlayerResponse() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public BlockPlayerResponse(String blockUserId, Integer code, String id, String namespace) {
    this.blockUserId = blockUserId;
    this.code = code;
    this.id = id;
    this.namespace = namespace;
  }

  public static String getType() {
    return "blockPlayerResponse";
  }

  public static BlockPlayerResponse createFromWSM(String message) {
    BlockPlayerResponse result = new BlockPlayerResponse();
    Map<String, String> response = parseWSM(message);
    result.blockUserId = response.get("blockUserId") != null ? response.get("blockUserId") : null;
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(BlockPlayerResponse.getType());
    if (blockUserId != null) {
      stringBuilder.append("\n").append("blockUserId: ").append(blockUserId);
    }
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
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("blockUserId", "blockUserId");
    result.put("code", "code");
    result.put("id", "id");
    result.put("namespace", "namespace");
    return result;
  }
}
