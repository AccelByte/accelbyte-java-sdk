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
public class GetFriendshipStatusResponse {
  private Integer code;
  private String friendshipStatus;
  private String id;

  private GetFriendshipStatusResponse() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetFriendshipStatusResponse(Integer code, String friendshipStatus, String id) {
    this.code = code;
    this.friendshipStatus = friendshipStatus;
    this.id = id;
  }

  public static String getType() {
    return "getFriendshipStatusResponse";
  }

  public static GetFriendshipStatusResponse createFromWSM(String message) {
    GetFriendshipStatusResponse result = new GetFriendshipStatusResponse();
    Map<String, String> response = parseWSM(message);
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.friendshipStatus =
        response.get("friendshipStatus") != null ? response.get("friendshipStatus") : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(GetFriendshipStatusResponse.getType());
    if (code != null) {
      stringBuilder.append("\n").append("code: ").append(code);
    }
    if (friendshipStatus != null) {
      stringBuilder.append("\n").append("friendshipStatus: ").append(friendshipStatus);
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
    result.put("code", "code");
    result.put("friendshipStatus", "friendshipStatus");
    result.put("id", "id");
    return result;
  }
}
