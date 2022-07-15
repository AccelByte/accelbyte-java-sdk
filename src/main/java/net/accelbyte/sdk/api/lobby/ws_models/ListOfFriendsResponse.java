/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.*;

import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ListOfFriendsResponse {
  private Integer code;
  private List<String> friendIds;
  private String id;

  private ListOfFriendsResponse() {}

  @Builder
  public ListOfFriendsResponse(Integer code, List<String> friendIds, String id) {
    this.code = code;
    this.friendIds = friendIds;
    this.id = id;
  }

  public static String getType() {
    return "listOfFriendsResponse";
  }

  public static ListOfFriendsResponse createFromWSM(String message) {
    ListOfFriendsResponse result = new ListOfFriendsResponse();
    Map<String, String> response = parseWSM(message);
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.friendIds =
        response.get("friendIds") != null
            ? convertWSMListToListString(response.get("friendIds"))
            : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(ListOfFriendsResponse.getType());
    if (code != null) {
      stringBuilder.append("\n").append("code: ").append(code);
    }
    if (friendIds != null) {
      stringBuilder.append("\n").append("friendIds: ").append(listToWSMList(friendIds));
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
    result.put("friendIds", "friendIds");
    result.put("id", "id");
    return result;
  }
}
