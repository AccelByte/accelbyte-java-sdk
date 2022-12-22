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
public class UserStatusNotif {
  private String activity;
  private Integer availability;
  private String lastSeenAt;
  private String userId;

  private UserStatusNotif() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UserStatusNotif(String activity, Integer availability, String lastSeenAt, String userId) {
    this.activity = activity;
    this.availability = availability;
    this.lastSeenAt = lastSeenAt;
    this.userId = userId;
  }

  public static String getType() {
    return "userStatusNotif";
  }

  public static UserStatusNotif createFromWSM(String message) {
    UserStatusNotif result = new UserStatusNotif();
    Map<String, String> response = parseWSM(message);
    result.activity = response.get("activity") != null ? response.get("activity") : null;
    result.availability =
        response.get("availability") != null ? Integer.valueOf(response.get("availability")) : null;
    result.lastSeenAt = response.get("lastSeenAt") != null ? response.get("lastSeenAt") : null;
    result.userId = response.get("userId") != null ? response.get("userId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(UserStatusNotif.getType());
    if (activity != null) {
      stringBuilder.append("\n").append("activity: ").append(activity);
    }
    if (availability != null) {
      stringBuilder.append("\n").append("availability: ").append(availability);
    }
    if (lastSeenAt != null) {
      stringBuilder.append("\n").append("lastSeenAt: ").append(lastSeenAt);
    }
    if (userId != null) {
      stringBuilder.append("\n").append("userId: ").append(userId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("activity", "activity");
    result.put("availability", "availability");
    result.put("lastSeenAt", "lastSeenAt");
    result.put("userId", "userId");
    return result;
  }
}
