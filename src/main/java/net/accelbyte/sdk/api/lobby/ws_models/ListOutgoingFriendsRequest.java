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
public class ListOutgoingFriendsRequest {
  private String id;

  private ListOutgoingFriendsRequest() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListOutgoingFriendsRequest(String id) {
    this.id = id;
  }

  public static String getType() {
    return "listOutgoingFriendsRequest";
  }

  public static ListOutgoingFriendsRequest createFromWSM(String message) {
    ListOutgoingFriendsRequest result = new ListOutgoingFriendsRequest();
    Map<String, String> response = parseWSM(message);
    result.id = response.get("id") != null ? response.get("id") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(ListOutgoingFriendsRequest.getType());
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("id", "id");
    return result;
  }
}
