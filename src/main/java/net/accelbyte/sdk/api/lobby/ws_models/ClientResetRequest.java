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
public class ClientResetRequest {
    private String namespace;
    private String userId;

    private ClientResetRequest() {

    }

    @Builder
    public ClientResetRequest (
        String namespace,
        String userId
    ) {
        this.namespace = namespace;
        this.userId = userId;
    }

    public static String getType(){
        return "clientResetRequest";
    }

    public static ClientResetRequest createFromWSM(String message) {
        ClientResetRequest result = new ClientResetRequest();
        Map<String, String> response = parseWSM(message);
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        result.userId = response.get("userId") != null ? response.get("userId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ClientResetRequest.getType());
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        if (userId != null) {
            stringBuilder
                    .append("\n")
                    .append("userId: ")
                    .append(userId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("userId","userId");
        return result;
    }
}