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
public class PartyLeaveNotif {
  private String leaderId;
  private String userId;

  private PartyLeaveNotif() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PartyLeaveNotif(String leaderId, String userId) {
    this.leaderId = leaderId;
    this.userId = userId;
  }

  public static String getType() {
    return "partyLeaveNotif";
  }

  public static PartyLeaveNotif createFromWSM(String message) {
    PartyLeaveNotif result = new PartyLeaveNotif();
    Map<String, String> response = parseWSM(message);
    result.leaderId = response.get("leaderId") != null ? response.get("leaderId") : null;
    result.userId = response.get("userId") != null ? response.get("userId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(PartyLeaveNotif.getType());
    if (leaderId != null) {
      stringBuilder.append("\n").append("leaderId: ").append(leaderId);
    }
    if (userId != null) {
      stringBuilder.append("\n").append("userId: ").append(userId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("leaderId", "leaderId");
    result.put("userId", "userId");
    return result;
  }
}
