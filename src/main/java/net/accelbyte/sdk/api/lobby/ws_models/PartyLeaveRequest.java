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
public class PartyLeaveRequest {
    private String id;
    private Boolean ignoreUserRegistry;

    private PartyLeaveRequest() {

    }

    @Builder
    public PartyLeaveRequest (
        String id,
        Boolean ignoreUserRegistry
    ) {
        this.id = id;
        this.ignoreUserRegistry = ignoreUserRegistry;
    }

    public static String getType(){
        return "partyLeaveRequest";
    }

    public static PartyLeaveRequest createFromWSM(String message) {
        PartyLeaveRequest result = new PartyLeaveRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.ignoreUserRegistry = response.get("ignoreUserRegistry") != null ? Boolean.valueOf(response.get("ignoreUserRegistry")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyLeaveRequest.getType());
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
        if (ignoreUserRegistry != null) {
            stringBuilder
                    .append("\n")
                    .append("ignoreUserRegistry: ")
                    .append(ignoreUserRegistry);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("ignoreUserRegistry","ignoreUserRegistry");
        return result;
    }
}