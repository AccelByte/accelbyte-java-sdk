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
public class SetReadyConsentRequest {
    private String id;
    private String matchId;

    private SetReadyConsentRequest() {

    }

    @Builder
    public SetReadyConsentRequest (
        String id,
        String matchId
    ) {
        this.id = id;
        this.matchId = matchId;
    }

    public static String getType(){
        return "setReadyConsentRequest";
    }

    public static SetReadyConsentRequest createFromWSM(String message) {
        SetReadyConsentRequest result = new SetReadyConsentRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.matchId = response.get("matchId") != null ? response.get("matchId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(SetReadyConsentRequest.getType());
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
        if (matchId != null) {
            stringBuilder
                    .append("\n")
                    .append("matchId: ")
                    .append(matchId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("matchId","matchId");
        return result;
    }
}