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
public class SetSessionAttributeRequest {
    private String id;
    private String key;
    private String namespace;
    private String value;

    private SetSessionAttributeRequest() {

    }

    @Builder
    public SetSessionAttributeRequest (
        String id,
        String key,
        String namespace,
        String value
    ) {
        this.id = id;
        this.key = key;
        this.namespace = namespace;
        this.value = value;
    }

    public static String getType(){
        return "setSessionAttributeRequest";
    }

    public static SetSessionAttributeRequest createFromWSM(String message) {
        SetSessionAttributeRequest result = new SetSessionAttributeRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.key = response.get("key") != null ? response.get("key") : null;
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        result.value = response.get("value") != null ? response.get("value") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(SetSessionAttributeRequest.getType());
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
        if (key != null) {
            stringBuilder
                    .append("\n")
                    .append("key: ")
                    .append(key);
        }
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        if (value != null) {
            stringBuilder
                    .append("\n")
                    .append("value: ")
                    .append(value);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("key","key");
        result.put("namespace","namespace");
        result.put("value","value");
        return result;
    }
}