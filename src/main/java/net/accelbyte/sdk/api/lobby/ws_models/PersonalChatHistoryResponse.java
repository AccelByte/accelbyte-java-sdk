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
public class PersonalChatHistoryResponse {
  private String chat;
  private Integer code;
  private String friendId;
  private String id;

  private PersonalChatHistoryResponse() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PersonalChatHistoryResponse(String chat, Integer code, String friendId, String id) {
    this.chat = chat;
    this.code = code;
    this.friendId = friendId;
    this.id = id;
  }

  public static String getType() {
    return "personalChatHistoryResponse";
  }

  public static PersonalChatHistoryResponse createFromWSM(String message) {
    PersonalChatHistoryResponse result = new PersonalChatHistoryResponse();
    Map<String, String> response = parseWSM(message);
    result.chat = response.get("chat") != null ? response.get("chat") : null;
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.friendId = response.get("friendId") != null ? response.get("friendId") : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(PersonalChatHistoryResponse.getType());
    if (chat != null) {
      stringBuilder.append("\n").append("chat: ").append(chat);
    }
    if (code != null) {
      stringBuilder.append("\n").append("code: ").append(code);
    }
    if (friendId != null) {
      stringBuilder.append("\n").append("friendId: ").append(friendId);
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
    result.put("chat", "chat");
    result.put("code", "code");
    result.put("friendId", "friendId");
    result.put("id", "id");
    return result;
  }
}
