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
public class ConnectNotif {
  private String lobbySessionId;

  private ConnectNotif() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ConnectNotif(String lobbySessionId) {
    this.lobbySessionId = lobbySessionId;
  }

  public static String getType() {
    return "connectNotif";
  }

  public static ConnectNotif createFromWSM(String message) {
    ConnectNotif result = new ConnectNotif();
    Map<String, String> response = parseWSM(message);
    result.lobbySessionId =
        response.get("lobbySessionId") != null ? response.get("lobbySessionId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(ConnectNotif.getType());
    if (lobbySessionId != null) {
      stringBuilder.append("\n").append("lobbySessionId: ").append(lobbySessionId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("lobbySessionId", "lobbySessionId");
    return result;
  }
}
