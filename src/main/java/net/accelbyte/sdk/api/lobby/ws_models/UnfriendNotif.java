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
public class UnfriendNotif {
  private String friendId;

  private UnfriendNotif() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UnfriendNotif(String friendId) {
    this.friendId = friendId;
  }

  public static String getType() {
    return "unfriendNotif";
  }

  public static UnfriendNotif createFromWSM(String message) {
    UnfriendNotif result = new UnfriendNotif();
    Map<String, String> response = parseWSM(message);
    result.friendId = response.get("friendId") != null ? response.get("friendId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(UnfriendNotif.getType());
    if (friendId != null) {
      stringBuilder.append("\n").append("friendId: ").append(friendId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("friendId", "friendId");
    return result;
  }
}
