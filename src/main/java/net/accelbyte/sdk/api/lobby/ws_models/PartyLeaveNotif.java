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
public class PartyLeaveNotif {
    private String userId;
    private String leaderId;

    private PartyLeaveNotif() {

    }

    @Builder
    public PartyLeaveNotif (
        String userId,
        String leaderId
    ) {
        this.userId = userId;
        this.leaderId = leaderId;
    }

    public static String getType(){
        return "partyLeaveNotif";
    }

    public static PartyLeaveNotif createFromWSM(String message) {
        PartyLeaveNotif result = new PartyLeaveNotif();
        Map<String, String> response = parseWSM(message);
        result.userId = response.get("userId") != null ? response.get("userId") : null;
        result.leaderId = response.get("leaderId") != null ? response.get("leaderId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyLeaveNotif.getType());
        if (userId != null) {
            stringBuilder
                    .append("\n")
                    .append("userId: ")
                    .append(userId);
        }
        if (leaderId != null) {
            stringBuilder
                    .append("\n")
                    .append("leaderId: ")
                    .append(leaderId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("userId","userId");
        result.put("leaderId","leaderId");
        return result;
    }
}