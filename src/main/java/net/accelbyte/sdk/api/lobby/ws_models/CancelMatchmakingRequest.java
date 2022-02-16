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
public class CancelMatchmakingRequest {
    private String id;
    private String gameMode;
    private Boolean isTempParty;

    private CancelMatchmakingRequest() {

    }

    @Builder
    public CancelMatchmakingRequest (
        String id,
        String gameMode,
        Boolean isTempParty
    ) {
        this.id = id;
        this.gameMode = gameMode;
        this.isTempParty = isTempParty;
    }

    public static String getType(){
        return "cancelMatchmakingRequest";
    }

    public static CancelMatchmakingRequest createFromWSM(String message) {
        CancelMatchmakingRequest result = new CancelMatchmakingRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.gameMode = response.get("gameMode") != null ? response.get("gameMode") : null;
        result.isTempParty = response.get("isTempParty") != null ? Boolean.valueOf(response.get("isTempParty")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(CancelMatchmakingRequest.getType());
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
        if (gameMode != null) {
            stringBuilder
                    .append("\n")
                    .append("gameMode: ")
                    .append(gameMode);
        }
        if (isTempParty != null) {
            stringBuilder
                    .append("\n")
                    .append("isTempParty: ")
                    .append(isTempParty);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("gameMode","gameMode");
        result.put("isTempParty","isTempParty");
        return result;
    }
}