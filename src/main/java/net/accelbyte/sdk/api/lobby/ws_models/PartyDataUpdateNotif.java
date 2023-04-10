/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import static net.accelbyte.sdk.core.util.Helper.convertJsonToMap;
import static net.accelbyte.sdk.core.util.Helper.convertWSMListToListString;
import static net.accelbyte.sdk.core.util.Helper.listToWSMList;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PartyDataUpdateNotif {
  private Map<String, ?> customAttributes;
  private List<String> invitees;
  private String leader;
  private List<String> members;
  private String namespace;
  private String partyId;
  private Integer updatedAt;

  private PartyDataUpdateNotif() {}

  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PartyDataUpdateNotif(
      Map<String, ?> customAttributes,
      List<String> invitees,
      String leader,
      List<String> members,
      String namespace,
      String partyId,
      Integer updatedAt) {
    this.customAttributes = customAttributes;
    this.invitees = invitees;
    this.leader = leader;
    this.members = members;
    this.namespace = namespace;
    this.partyId = partyId;
    this.updatedAt = updatedAt;
  }

  public static String getType() {
    return "partyDataUpdateNotif";
  }

  public static PartyDataUpdateNotif createFromWSM(String message) {
    PartyDataUpdateNotif result = new PartyDataUpdateNotif();
    Map<String, String> response = parseWSM(message);
    result.customAttributes =
        response.get("customAttributes") != null
            ? convertJsonToMap(response.get("customAttributes"))
            : null;
    result.invitees =
        response.get("invitees") != null
            ? convertWSMListToListString(response.get("invitees"))
            : null;
    result.leader = response.get("leader") != null ? response.get("leader") : null;
    result.members =
        response.get("members") != null
            ? convertWSMListToListString(response.get("members"))
            : null;
    result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
    result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
    result.updatedAt =
        response.get("updatedAt") != null ? Integer.valueOf(response.get("updatedAt")) : null;
    return result;
  }

  public String toWSM() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("type: ").append(PartyDataUpdateNotif.getType());
    if (customAttributes != null) {
      try {
        String json = new ObjectMapper().writeValueAsString(customAttributes);
        stringBuilder.append("\n").append("customAttributes: ").append(json);
      } catch (JsonProcessingException e) {
        e.printStackTrace();
      }
    }
    if (invitees != null) {
      stringBuilder.append("\n").append("invitees: ").append(listToWSMList(invitees));
    }
    if (leader != null) {
      stringBuilder.append("\n").append("leader: ").append(leader);
    }
    if (members != null) {
      stringBuilder.append("\n").append("members: ").append(listToWSMList(members));
    }
    if (namespace != null) {
      stringBuilder.append("\n").append("namespace: ").append(namespace);
    }
    if (partyId != null) {
      stringBuilder.append("\n").append("partyId: ").append(partyId);
    }
    if (updatedAt != null) {
      stringBuilder.append("\n").append("updatedAt: ").append(updatedAt);
    }
    return stringBuilder.toString();
  }

  public static Map<String, String> getFieldInfo() {
    Map<String, String> result = new HashMap<>();
    result.put("customAttributes", "customAttributes");
    result.put("invitees", "invitees");
    result.put("leader", "leader");
    result.put("members", "members");
    result.put("namespace", "namespace");
    result.put("partyId", "partyId");
    result.put("updatedAt", "updatedAt");
    return result;
  }
}
