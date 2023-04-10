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
public class ChannelChatNotif {
  private String channelSlug;
  private String from;
  private String payload;
  private String sentAt;

  private ChannelChatNotif() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ChannelChatNotif(String channelSlug, String from, String payload, String sentAt) {
    this.channelSlug = channelSlug;
    this.from = from;
    this.payload = payload;
    this.sentAt = sentAt;
  }

  public static String getType() {
    return "channelChatNotif";
  }

  public static ChannelChatNotif createFromWSM(String message) {
    ChannelChatNotif result = new ChannelChatNotif();
    Map<String, String> response = parseWSM(message);
    result.channelSlug = response.get("channelSlug") != null ? response.get("channelSlug") : null;
    result.from = response.get("from") != null ? response.get("from") : null;
    result.payload = response.get("payload") != null ? response.get("payload") : null;
    result.sentAt = response.get("sentAt") != null ? response.get("sentAt") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(ChannelChatNotif.getType());
    if (channelSlug != null) {
      stringBuilder.append("\n").append("channelSlug: ").append(channelSlug);
    }
    if (from != null) {
      stringBuilder.append("\n").append("from: ").append(from);
    }
    if (payload != null) {
      stringBuilder.append("\n").append("payload: ").append(payload);
    }
    if (sentAt != null) {
      stringBuilder.append("\n").append("sentAt: ").append(sentAt);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("channelSlug", "channelSlug");
    result.put("from", "from");
    result.put("payload", "payload");
    result.put("sentAt", "sentAt");
    return result;
  }
}
