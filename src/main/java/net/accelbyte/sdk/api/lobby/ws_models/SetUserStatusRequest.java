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
public class SetUserStatusRequest {
  private String activity;
  private Integer availability;
  private String id;

  private SetUserStatusRequest() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SetUserStatusRequest(String activity, Integer availability, String id) {
    this.activity = activity;
    this.availability = availability;
    this.id = id;
  }

  public static String getType() {
    return "setUserStatusRequest";
  }

  public static SetUserStatusRequest createFromWSM(String message) {
    SetUserStatusRequest result = new SetUserStatusRequest();
    Map<String, String> response = parseWSM(message);
    result.activity = response.get("activity") != null ? response.get("activity") : null;
    result.availability =
        response.get("availability") != null ? Integer.valueOf(response.get("availability")) : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(SetUserStatusRequest.getType());
    if (activity != null) {
      stringBuilder.append("\n").append("activity: ").append(activity);
    }
    if (availability != null) {
      stringBuilder.append("\n").append("availability: ").append(availability);
    }
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("activity", "activity");
    result.put("availability", "availability");
    result.put("id", "id");
    return result;
  }
}
