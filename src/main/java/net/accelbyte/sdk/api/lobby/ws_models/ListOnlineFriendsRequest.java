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
public class ListOnlineFriendsRequest {
  private String id;

  private ListOnlineFriendsRequest() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListOnlineFriendsRequest(String id) {
    this.id = id;
  }

  public static String getType() {
    return "listOnlineFriendsRequest";
  }

  public static ListOnlineFriendsRequest createFromWSM(String message) {
    ListOnlineFriendsRequest result = new ListOnlineFriendsRequest();
    Map<String, String> response = parseWSM(message);
    result.id = response.get("id") != null ? response.get("id") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(ListOnlineFriendsRequest.getType());
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
