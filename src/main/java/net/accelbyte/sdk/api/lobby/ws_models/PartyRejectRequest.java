/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
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
public class PartyRejectRequest {
    private String id;
    private String invitationToken;
    private String partyId;

    private PartyRejectRequest() {

    }

    @Builder
    public PartyRejectRequest (
        String id,
        String invitationToken,
        String partyId
    ) {
        this.id = id;
        this.invitationToken = invitationToken;
        this.partyId = partyId;
    }

    public static String getType(){
        return "partyRejectRequest";
    }

    public static PartyRejectRequest createFromWSM(String message) {
        PartyRejectRequest result = new PartyRejectRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.invitationToken = response.get("invitationToken") != null ? response.get("invitationToken") : null;
        result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyRejectRequest.getType());
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
        result.put("id","id");
        result.put("invitationToken","invitationToken");
        result.put("partyId","partyId");
        return result;
    }
}