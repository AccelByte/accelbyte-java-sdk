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
public class CancelMatchmakingRequest {
  private String gameMode;
  private String id;
  private Boolean isTempParty;

  private CancelMatchmakingRequest() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CancelMatchmakingRequest(String gameMode, String id, Boolean isTempParty) {
    this.gameMode = gameMode;
    this.id = id;
    this.isTempParty = isTempParty;
  }

  public static String getType() {
    return "cancelMatchmakingRequest";
  }

  public static CancelMatchmakingRequest createFromWSM(String message) {
    CancelMatchmakingRequest result = new CancelMatchmakingRequest();
    Map<String, String> response = parseWSM(message);
    result.gameMode = response.get("gameMode") != null ? response.get("gameMode") : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    result.isTempParty =
        response.get("isTempParty") != null ? Boolean.valueOf(response.get("isTempParty")) : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(CancelMatchmakingRequest.getType());
    if (gameMode != null) {
      stringBuilder.append("\n").append("gameMode: ").append(gameMode);
    }
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    if (isTempParty != null) {
      stringBuilder.append("\n").append("isTempParty: ").append(isTempParty);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("gameMode", "gameMode");
    result.put("id", "id");
    result.put("isTempParty", "isTempParty");
    return result;
  }
}
