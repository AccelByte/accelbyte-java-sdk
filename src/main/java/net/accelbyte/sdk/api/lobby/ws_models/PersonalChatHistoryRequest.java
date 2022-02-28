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
public class PersonalChatHistoryRequest {
    private String friendId;
    private String id;

    private PersonalChatHistoryRequest() {

    }

    @Builder
    public PersonalChatHistoryRequest (
        String friendId,
        String id
    ) {
        this.friendId = friendId;
        this.id = id;
    }

    public static String getType(){
        return "personalChatHistoryRequest";
    }

    public static PersonalChatHistoryRequest createFromWSM(String message) {
        PersonalChatHistoryRequest result = new PersonalChatHistoryRequest();
        Map<String, String> response = parseWSM(message);
        result.friendId = response.get("friendId") != null ? response.get("friendId") : null;
        result.id = response.get("id") != null ? response.get("id") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PersonalChatHistoryRequest.getType());
        if (friendId != null) {
            stringBuilder
                    .append("\n")
                    .append("friendId: ")
                    .append(friendId);
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
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("friendId","friendId");
        result.put("id","id");
        return result;
    }
}