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
public class JoinDefaultChannelResponse {
  private String channelSlug;
  private Integer code;
  private String id;

  private JoinDefaultChannelResponse() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public JoinDefaultChannelResponse(String channelSlug, Integer code, String id) {
    this.channelSlug = channelSlug;
    this.code = code;
    this.id = id;
  }

  public static String getType() {
    return "joinDefaultChannelResponse";
  }

  public static JoinDefaultChannelResponse createFromWSM(String message) {
    JoinDefaultChannelResponse result = new JoinDefaultChannelResponse();
    Map<String, String> response = parseWSM(message);
    result.channelSlug = response.get("channelSlug") != null ? response.get("channelSlug") : null;
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(JoinDefaultChannelResponse.getType());
    if (channelSlug != null) {
      stringBuilder.append("\n").append("channelSlug: ").append(channelSlug);
    }
    if (code != null) {
      stringBuilder.append("\n").append("code: ").append(code);
    }
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("channelSlug", "channelSlug");
    result.put("code", "code");
    result.put("id", "id");
    return result;
  }
}
