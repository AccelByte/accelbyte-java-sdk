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
public class SetUserStatusRequest {
    private String id;
    private Integer availability;
    private String activity;

    private SetUserStatusRequest() {

    }

    @Builder
    public SetUserStatusRequest (
        String id,
        Integer availability,
        String activity
    ) {
        this.id = id;
        this.availability = availability;
        this.activity = activity;
    }

    public static String getType(){
        return "setUserStatusRequest";
    }

    public static SetUserStatusRequest createFromWSM(String message) {
        SetUserStatusRequest result = new SetUserStatusRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.availability = response.get("availability") != null ? Integer.valueOf(response.get("availability")) : null;
        result.activity = response.get("activity") != null ? response.get("activity") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(SetUserStatusRequest.getType());
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
        if (availability != null) {
            stringBuilder
                    .append("\n")
                    .append("availability: ")
                    .append(availability);
        }
        if (activity != null) {
            stringBuilder
                    .append("\n")
                    .append("activity: ")
                    .append(activity);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("availability","availability");
        result.put("activity","activity");
        return result;
    }
}