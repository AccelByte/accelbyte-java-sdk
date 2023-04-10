/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.convertJsonToMap;
import static net.accelbyte.sdk.core.util.Helper.generateUUID;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StartMatchmakingRequest {
  private String extraAttributes;
  private String gameMode;
  private String id;
  private Map<String, ?> partyAttributes;
  private Integer priority;
  private String tempParty;

  private StartMatchmakingRequest() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public StartMatchmakingRequest(
      String extraAttributes,
      String gameMode,
      String id,
      Map<String, ?> partyAttributes,
      Integer priority,
      String tempParty) {
    this.extraAttributes = extraAttributes;
    this.gameMode = gameMode;
    this.id = id;
    this.partyAttributes = partyAttributes;
    this.priority = priority;
    this.tempParty = tempParty;
  }

  public static String getType() {
    return "startMatchmakingRequest";
  }

  public static StartMatchmakingRequest createFromWSM(String message) {
    StartMatchmakingRequest result = new StartMatchmakingRequest();
    Map<String, String> response = parseWSM(message);
    result.extraAttributes =
        response.get("extraAttributes") != null ? response.get("extraAttributes") : null;
    result.gameMode = response.get("gameMode") != null ? response.get("gameMode") : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    result.partyAttributes =
        response.get("partyAttributes") != null
            ? convertJsonToMap(response.get("partyAttributes"))
            : null;
    result.priority =
        response.get("priority") != null ? Integer.valueOf(response.get("priority")) : null;
    result.tempParty = response.get("tempParty") != null ? response.get("tempParty") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(StartMatchmakingRequest.getType());
    if (extraAttributes != null) {
      stringBuilder.append("\n").append("extraAttributes: ").append(extraAttributes);
    }
    if (gameMode != null) {
      stringBuilder.append("\n").append("gameMode: ").append(gameMode);
    }
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    if (partyAttributes != null) {
      try {
        String json = new ObjectMapper().writeValueAsString(partyAttributes);
        stringBuilder.append("\n").append("partyAttributes: ").append(json);
      } catch (JsonProcessingException e) {
        e.printStackTrace();
      }
    }
    if (priority != null) {
      stringBuilder.append("\n").append("priority: ").append(priority);
    }
    if (tempParty != null) {
      stringBuilder.append("\n").append("tempParty: ").append(tempParty);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("extraAttributes", "extraAttributes");
    result.put("gameMode", "gameMode");
    result.put("id", "id");
    result.put("partyAttributes", "partyAttributes");
    result.put("priority", "priority");
    result.put("tempParty", "tempParty");
    return result;
  }
}
