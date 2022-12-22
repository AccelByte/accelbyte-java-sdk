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
public class GetAllSessionAttributeResponse {
  private Map<String, String> attributes;
  private Integer code;
  private String id;

  private GetAllSessionAttributeResponse() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetAllSessionAttributeResponse(Map<String, String> attributes, Integer code, String id) {
    this.attributes = attributes;
    this.code = code;
    this.id = id;
  }

  public static String getType() {
    return "getAllSessionAttributeResponse";
  }

  public static GetAllSessionAttributeResponse createFromWSM(String message) {
    GetAllSessionAttributeResponse result = new GetAllSessionAttributeResponse();
    Map<String, String> response = parseWSM(message);
    result.attributes =
        response.get("attributes") != null ? convertJsonToMap(response.get("attributes")) : null;
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(GetAllSessionAttributeResponse.getType());
    if (attributes != null) {
      try {
        String json = new ObjectMapper().writeValueAsString(attributes);
        stringBuilder.append("\n").append("attributes: ").append(json);
      } catch (JsonProcessingException e) {
        e.printStackTrace();
      }
    }
    if (code != null) {
      stringBuilder.append("\n").append("code: ").append(code);
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
    result.put("attributes", "attributes");
    result.put("code", "code");
    result.put("id", "id");
    return result;
  }
}
