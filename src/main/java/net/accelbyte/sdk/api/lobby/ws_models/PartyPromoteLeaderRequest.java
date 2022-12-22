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
public class PartyPromoteLeaderRequest {
  private String id;
  private String newLeaderUserId;

  private PartyPromoteLeaderRequest() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PartyPromoteLeaderRequest(String id, String newLeaderUserId) {
    this.id = id;
    this.newLeaderUserId = newLeaderUserId;
  }

  public static String getType() {
    return "partyPromoteLeaderRequest";
  }

  public static PartyPromoteLeaderRequest createFromWSM(String message) {
    PartyPromoteLeaderRequest result = new PartyPromoteLeaderRequest();
    Map<String, String> response = parseWSM(message);
    result.id = response.get("id") != null ? response.get("id") : null;
    result.newLeaderUserId =
        response.get("newLeaderUserId") != null ? response.get("newLeaderUserId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(PartyPromoteLeaderRequest.getType());
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    if (newLeaderUserId != null) {
      stringBuilder.append("\n").append("newLeaderUserId: ").append(newLeaderUserId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("id", "id");
    result.put("newLeaderUserId", "newLeaderUserId");
    return result;
  }
}
