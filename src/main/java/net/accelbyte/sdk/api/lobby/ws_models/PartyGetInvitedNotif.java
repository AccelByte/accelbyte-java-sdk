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
public class PartyGetInvitedNotif {
    private String from;
    private String invitationToken;
    private String partyId;

    private PartyGetInvitedNotif() {

    }

    @Builder
    public PartyGetInvitedNotif (
        String from,
        String invitationToken,
        String partyId
    ) {
        this.from = from;
        this.invitationToken = invitationToken;
        this.partyId = partyId;
    }

    public static String getType(){
        return "partyGetInvitedNotif";
    }

    public static PartyGetInvitedNotif createFromWSM(String message) {
        PartyGetInvitedNotif result = new PartyGetInvitedNotif();
        Map<String, String> response = parseWSM(message);
        result.from = response.get("from") != null ? response.get("from") : null;
        result.invitationToken = response.get("invitationToken") != null ? response.get("invitationToken") : null;
        result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyGetInvitedNotif.getType());
        if (from != null) {
            stringBuilder
                    .append("\n")
                    .append("from: ")
                    .append(from);
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
        result.put("from","from");
        result.put("invitationToken","invitationToken");
        result.put("partyId","partyId");
        return result;
    }
}