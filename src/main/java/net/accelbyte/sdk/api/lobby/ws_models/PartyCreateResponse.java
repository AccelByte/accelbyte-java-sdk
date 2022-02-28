/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.*;

import static net.accelbyte.sdk.core.util.Helper.*;

@Getter
@Setter
public class PartyCreateResponse {
    private Integer code;
    private String id;
    private String invitationToken;
    private String invitees;
    private String leaderId;
    private String members;
    private String partyId;

    private PartyCreateResponse() {

    }

    @Builder
    public PartyCreateResponse (
        Integer code,
        String id,
        String invitationToken,
        String invitees,
        String leaderId,
        String members,
        String partyId
    ) {
        this.code = code;
        this.id = id;
        this.invitationToken = invitationToken;
        this.invitees = invitees;
        this.leaderId = leaderId;
        this.members = members;
        this.partyId = partyId;
    }

    public static String getType(){
        return "partyCreateResponse";
    }

    public static PartyCreateResponse createFromWSM(String message) {
        PartyCreateResponse result = new PartyCreateResponse();
        Map<String, String> response = parseWSM(message);
        result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
        result.id = response.get("id") != null ? response.get("id") : null;
        result.invitationToken = response.get("invitationToken") != null ? response.get("invitationToken") : null;
        result.invitees = response.get("invitees") != null ? response.get("invitees") : null;
        result.leaderId = response.get("leaderId") != null ? response.get("leaderId") : null;
        result.members = response.get("members") != null ? response.get("members") : null;
        result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyCreateResponse.getType());
        if (code != null) {
            stringBuilder
                    .append("\n")
                    .append("code: ")
                    .append(code);
        }
        if (id != null) {
            stringBuilder
                    .append("\n")
                    .append("id: ")
                    .append(id);
        } else {
            stringBuilder
                    .append("\n")
                    .append("id: ")
                    .append(generateUUID());
        }
        if (invitationToken != null) {
            stringBuilder
                    .append("\n")
                    .append("invitationToken: ")
                    .append(invitationToken);
        }
        if (invitees != null) {
            stringBuilder
                    .append("\n")
                    .append("invitees: ")
                    .append(invitees);
        }
        if (leaderId != null) {
            stringBuilder
                    .append("\n")
                    .append("leaderId: ")
                    .append(leaderId);
        }
        if (members != null) {
            stringBuilder
                    .append("\n")
                    .append("members: ")
                    .append(members);
        }
        if (partyId != null) {
            stringBuilder
                    .append("\n")
                    .append("partyId: ")
                    .append(partyId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code","code");
        result.put("id","id");
        result.put("invitationToken","invitationToken");
        result.put("invitees","invitees");
        result.put("leaderId","leaderId");
        result.put("members","members");
        result.put("partyId","partyId");
        return result;
    }
}