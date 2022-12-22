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
public class PartyInfoResponse {
  private Integer code;
  private Map<String, ?> customAttributes;
  private String id;
  private String invitationToken;
  private String invitees;
  private String leaderId;
  private String members;
  private String partyId;

  private PartyInfoResponse() {}

  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PartyInfoResponse(
      Integer code,
      Map<String, ?> customAttributes,
      String id,
      String invitationToken,
      String invitees,
      String leaderId,
      String members,
      String partyId) {
    this.code = code;
    this.customAttributes = customAttributes;
    this.id = id;
    this.invitationToken = invitationToken;
    this.invitees = invitees;
    this.leaderId = leaderId;
    this.members = members;
    this.partyId = partyId;
  }

  public static String getType() {
    return "partyInfoResponse";
  }

  public static PartyInfoResponse createFromWSM(String message) {
    PartyInfoResponse result = new PartyInfoResponse();
    Map<String, String> response = parseWSM(message);
    result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
    result.customAttributes =
        response.get("customAttributes") != null
            ? convertJsonToMap(response.get("customAttributes"))
            : null;
    result.id = response.get("id") != null ? response.get("id") : null;
    result.invitationToken =
        response.get("invitationToken") != null ? response.get("invitationToken") : null;
    result.invitees = response.get("invitees") != null ? response.get("invitees") : null;
    result.leaderId = response.get("leaderId") != null ? response.get("leaderId") : null;
    result.members = response.get("members") != null ? response.get("members") : null;
    result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(PartyInfoResponse.getType());
    if (code != null) {
      stringBuilder.append("\n").append("code: ").append(code);
    }
    if (customAttributes != null) {
      try {
        String json = new ObjectMapper().writeValueAsString(customAttributes);
        stringBuilder.append("\n").append("customAttributes: ").append(json);
      } catch (JsonProcessingException e) {
        e.printStackTrace();
      }
    }
    if (id != null) {
      stringBuilder.append("\n").append("id: ").append(id);
    } else {
      stringBuilder.append("\n").append("id: ").append(generateUUID());
    }
    if (invitationToken != null) {
      stringBuilder.append("\n").append("invitationToken: ").append(invitationToken);
    }
    if (invitees != null) {
      stringBuilder.append("\n").append("invitees: ").append(invitees);
    }
    if (leaderId != null) {
      stringBuilder.append("\n").append("leaderId: ").append(leaderId);
    }
    if (members != null) {
      stringBuilder.append("\n").append("members: ").append(members);
    }
    if (partyId != null) {
      stringBuilder.append("\n").append("partyId: ").append(partyId);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("code", "code");
    result.put("customAttributes", "customAttributes");
    result.put("id", "id");
    result.put("invitationToken", "invitationToken");
    result.put("invitees", "invitees");
    result.put("leaderId", "leaderId");
    result.put("members", "members");
    result.put("partyId", "partyId");
    return result;
  }
}
