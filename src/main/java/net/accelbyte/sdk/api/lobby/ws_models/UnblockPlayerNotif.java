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
public class UnblockPlayerNotif {
  private String unblockedUserId;
  private String userId;

  private UnblockPlayerNotif() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UnblockPlayerNotif(String unblockedUserId, String userId) {
    this.unblockedUserId = unblockedUserId;
    this.userId = userId;
  }

  public static String getType() {
    return "unblockPlayerNotif";
  }

  public static UnblockPlayerNotif createFromWSM(String message) {
    UnblockPlayerNotif result = new UnblockPlayerNotif();
    Map<String, String> response = parseWSM(message);
    result.unblockedUserId =
        response.get("unblockedUserId") != null ? response.get("unblockedUserId") : null;
    result.userId = response.get("userId") != null ? response.get("userId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(UnblockPlayerNotif.getType());
    if (unblockedUserId != null) {
      stringBuilder.append("\n").append("unblockedUserId: ").append(unblockedUserId);
    }
    if (userId != null) {
      stringBuilder.append("\n").append("userId: ").append(userId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("unblockedUserId", "unblockedUserId");
    result.put("userId", "userId");
    return result;
  }
}
