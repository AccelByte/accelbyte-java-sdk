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
public class RejectFriendsNotif {
  private String userId;

  private RejectFriendsNotif() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RejectFriendsNotif(String userId) {
    this.userId = userId;
  }

  public static String getType() {
    return "rejectFriendsNotif";
  }

  public static RejectFriendsNotif createFromWSM(String message) {
    RejectFriendsNotif result = new RejectFriendsNotif();
    Map<String, String> response = parseWSM(message);
    result.userId = response.get("userId") != null ? response.get("userId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(RejectFriendsNotif.getType());
    if (userId != null) {
      stringBuilder.append("\n").append("userId: ").append(userId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("userId", "userId");
    return result;
  }
}
