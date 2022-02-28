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
public class PersonalChatRequest {
    private String from;
    private String id;
    private String payload;
    private Integer receivedAt;
    private String to;

    private PersonalChatRequest() {

    }

    @Builder
    public PersonalChatRequest (
        String from,
        String id,
        String payload,
        Integer receivedAt,
        String to
    ) {
        this.from = from;
        this.id = id;
        this.payload = payload;
        this.receivedAt = receivedAt;
        this.to = to;
    }

    public static String getType(){
        return "personalChatRequest";
    }

    public static PersonalChatRequest createFromWSM(String message) {
        PersonalChatRequest result = new PersonalChatRequest();
        Map<String, String> response = parseWSM(message);
        result.from = response.get("from") != null ? response.get("from") : null;
        result.id = response.get("id") != null ? response.get("id") : null;
        result.payload = response.get("payload") != null ? response.get("payload") : null;
        result.receivedAt = response.get("receivedAt") != null ? Integer.valueOf(response.get("receivedAt")) : null;
        result.to = response.get("to") != null ? response.get("to") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PersonalChatRequest.getType());
        if (from != null) {
            stringBuilder
                    .append("\n")
                    .append("from: ")
                    .append(from);
        }
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
        if (payload != null) {
            stringBuilder
                    .append("\n")
                    .append("payload: ")
                    .append(payload);
        }
        if (receivedAt != null) {
            stringBuilder
                    .append("\n")
                    .append("receivedAt: ")
                    .append(receivedAt);
        }
        if (to != null) {
            stringBuilder
                    .append("\n")
                    .append("to: ")
                    .append(to);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("from","from");
        result.put("id","id");
        result.put("payload","payload");
        result.put("receivedAt","receivedAt");
        result.put("to","to");
        return result;
    }
}