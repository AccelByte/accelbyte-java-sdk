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
public class MessageNotif {
  private String from;
  private String id;
  private String payload;
  private Integer sentAt;
  private String to;
  private String topic;

  private MessageNotif() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public MessageNotif(
      String from, String id, String payload, Integer sentAt, String to, String topic) {
    this.from = from;
    this.id = id;
    this.payload = payload;
    this.sentAt = sentAt;
    this.to = to;
    this.topic = topic;
  }

  public static String getType() {
    return "messageNotif";
  }

  public static MessageNotif createFromWSM(String message) {
    MessageNotif result = new MessageNotif();
    Map<String, String> response = parseWSM(message);
    result.from = response.get("from") != null ? response.get("from") : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    result.payload = response.get("payload") != null ? response.get("payload") : null;
    result.sentAt = response.get("sentAt") != null ? Integer.valueOf(response.get("sentAt")) : null;
    result.to = response.get("to") != null ? response.get("to") : null;
    result.topic = response.get("topic") != null ? response.get("topic") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(MessageNotif.getType());
    if (from != null) {
      stringBuilder.append("\n").append("from: ").append(from);
    }
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    if (payload != null) {
      stringBuilder.append("\n").append("payload: ").append(payload);
    }
    if (sentAt != null) {
      stringBuilder.append("\n").append("sentAt: ").append(sentAt);
    }
    if (to != null) {
      stringBuilder.append("\n").append("to: ").append(to);
    }
    if (topic != null) {
      stringBuilder.append("\n").append("topic: ").append(topic);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("from", "from");
    result.put("id", "id");
    result.put("payload", "payload");
    result.put("sentAt", "sentAt");
    result.put("to", "to");
    result.put("topic", "topic");
    return result;
  }
}
