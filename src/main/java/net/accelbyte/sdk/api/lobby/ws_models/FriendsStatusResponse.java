/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.convertWSMListToListInteger;
import static net.accelbyte.sdk.core.util.Helper.convertWSMListToListString;
import static net.accelbyte.sdk.core.util.Helper.generateUUID;
import static net.accelbyte.sdk.core.util.Helper.listToWSMList;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FriendsStatusResponse {
  private List<String> activity;
  private List<Integer> availability;
  private Integer code;
  private List<String> friendIds;
  private String id;
  private List<String> lastSeenAt;

  private FriendsStatusResponse() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public FriendsStatusResponse(
      List<String> activity,
      List<Integer> availability,
      Integer code,
      List<String> friendIds,
      String id,
      List<String> lastSeenAt) {
    this.activity = activity;
    this.availability = availability;
    this.code = code;
    this.friendIds = friendIds;
    this.id = id;
    this.lastSeenAt = lastSeenAt;
  }

  public static String getType() {
    return "friendsStatusResponse";
  }

  public static FriendsStatusResponse createFromWSM(String message) {
    FriendsStatusResponse result = new FriendsStatusResponse();
    Map<String, String> response = parseWSM(message);
    result.activity =
        response.get("activity") != null
            ? convertWSMListToListString(response.get("activity"))
            : null;
    result.availability =
        response.get("availability") != null
            ? convertWSMListToListInteger(response.get("availability"))
            : null;
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.friendIds =
        response.get("friendIds") != null
            ? convertWSMListToListString(response.get("friendIds"))
            : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    result.lastSeenAt =
        response.get("lastSeenAt") != null
            ? convertWSMListToListString(response.get("lastSeenAt"))
            : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(FriendsStatusResponse.getType());
    if (activity != null) {
      stringBuilder.append("\n").append("activity: ").append(listToWSMList(activity));
    }
    if (availability != null) {
      stringBuilder.append("\n").append("availability: ").append(listToWSMList(availability));
    }
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
    if (lastSeenAt != null) {
      stringBuilder.append("\n").append("lastSeenAt: ").append(listToWSMList(lastSeenAt));
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("activity", "activity");
    result.put("availability", "availability");
    result.put("code", "code");
    result.put("friendIds", "friendIds");
    result.put("id", "id");
    result.put("lastSeenAt", "lastSeenAt");
    return result;
  }
}
