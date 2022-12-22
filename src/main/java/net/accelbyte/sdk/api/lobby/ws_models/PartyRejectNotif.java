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
public class PartyRejectNotif {
  private String leaderId;
  private String partyId;
  private String userId;

  private PartyRejectNotif() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PartyRejectNotif(String leaderId, String partyId, String userId) {
    this.leaderId = leaderId;
    this.partyId = partyId;
    this.userId = userId;
  }

  public static String getType() {
    return "partyRejectNotif";
  }

  public static PartyRejectNotif createFromWSM(String message) {
    PartyRejectNotif result = new PartyRejectNotif();
    Map<String, String> response = parseWSM(message);
    result.leaderId = response.get("leaderId") != null ? response.get("leaderId") : null;
    result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
    result.userId = response.get("userId") != null ? response.get("userId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(PartyRejectNotif.getType());
    if (leaderId != null) {
      stringBuilder.append("\n").append("leaderId: ").append(leaderId);
    }
    if (partyId != null) {
      stringBuilder.append("\n").append("partyId: ").append(partyId);
    }
    if (userId != null) {
      stringBuilder.append("\n").append("userId: ").append(userId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("leaderId", "leaderId");
    result.put("partyId", "partyId");
    result.put("userId", "userId");
    return result;
  }
}
