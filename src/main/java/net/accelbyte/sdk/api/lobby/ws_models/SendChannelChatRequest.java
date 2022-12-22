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
public class SendChannelChatRequest {
  private String channelSlug;
  private String id;
  private String payload;

  private SendChannelChatRequest() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SendChannelChatRequest(String channelSlug, String id, String payload) {
    this.channelSlug = channelSlug;
    this.id = id;
    this.payload = payload;
  }

  public static String getType() {
    return "sendChannelChatRequest";
  }

  public static SendChannelChatRequest createFromWSM(String message) {
    SendChannelChatRequest result = new SendChannelChatRequest();
    Map<String, String> response = parseWSM(message);
    result.channelSlug = response.get("channelSlug") != null ? response.get("channelSlug") : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    result.payload = response.get("payload") != null ? response.get("payload") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(SendChannelChatRequest.getType());
    if (channelSlug != null) {
      stringBuilder.append("\n").append("channelSlug: ").append(channelSlug);
    }
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    if (payload != null) {
      stringBuilder.append("\n").append("payload: ").append(payload);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("channelSlug", "channelSlug");
    result.put("id", "id");
    result.put("payload", "payload");
    return result;
  }
}
