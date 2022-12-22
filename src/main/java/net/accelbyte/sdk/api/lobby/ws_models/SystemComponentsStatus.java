/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.convertJsonToMap;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SystemComponentsStatus {
  private Map<String, Boolean> components;

  private SystemComponentsStatus() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SystemComponentsStatus(Map<String, Boolean> components) {
    this.components = components;
  }

  public static String getType() {
    return "systemComponentsStatus";
  }

  public static SystemComponentsStatus createFromWSM(String message) {
    SystemComponentsStatus result = new SystemComponentsStatus();
    Map<String, String> response = parseWSM(message);
    result.components =
        response.get("components") != null ? convertJsonToMap(response.get("components")) : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(SystemComponentsStatus.getType());
    if (components != null) {
      try {
        String json = new ObjectMapper().writeValueAsString(components);
        stringBuilder.append("\n").append("components: ").append(json);
      } catch (JsonProcessingException e) {
        e.printStackTrace();
      }
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("components", "components");
    return result;
  }
}
