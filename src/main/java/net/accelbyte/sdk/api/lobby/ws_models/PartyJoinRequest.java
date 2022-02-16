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
public class PartyJoinRequest {
    private String id;
    private String partyId;
    private String invitationToken;

    private PartyJoinRequest() {

    }

    @Builder
    public PartyJoinRequest (
        String id,
        String partyId,
        String invitationToken
    ) {
        this.id = id;
        this.partyId = partyId;
        this.invitationToken = invitationToken;
    }

    public static String getType(){
        return "partyJoinRequest";
    }

    public static PartyJoinRequest createFromWSM(String message) {
        PartyJoinRequest result = new PartyJoinRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
        result.invitationToken = response.get("invitationToken") != null ? response.get("invitationToken") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyJoinRequest.getType());
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
        if (partyId != null) {
            stringBuilder
                    .append("\n")
                    .append("partyId: ")
                    .append(partyId);
        }
        if (invitationToken != null) {
            stringBuilder
                    .append("\n")
                    .append("invitationToken: ")
                    .append(invitationToken);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("partyId","partyId");
        result.put("invitationToken","invitationToken");
        return result;
    }
}