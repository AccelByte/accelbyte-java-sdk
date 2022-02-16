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
public class PersonalChatHistoryResponse {
    private String id;
    private String code;
    private String friendId;
    private String chat;

    private PersonalChatHistoryResponse() {

    }

    @Builder
    public PersonalChatHistoryResponse (
        String id,
        String code,
        String friendId,
        String chat
    ) {
        this.id = id;
        this.code = code;
        this.friendId = friendId;
        this.chat = chat;
    }

    public static String getType(){
        return "personalChatHistoryResponse";
    }

    public static PersonalChatHistoryResponse createFromWSM(String message) {
        PersonalChatHistoryResponse result = new PersonalChatHistoryResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.friendId = response.get("friendId") != null ? response.get("friendId") : null;
        result.chat = response.get("chat") != null ? response.get("chat") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PersonalChatHistoryResponse.getType());
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
        if (code != null) {
            stringBuilder
                    .append("\n")
                    .append("code: ")
                    .append(code);
        }
        if (friendId != null) {
            stringBuilder
                    .append("\n")
                    .append("friendId: ")
                    .append(friendId);
        }
        if (chat != null) {
            stringBuilder
                    .append("\n")
                    .append("chat: ")
                    .append(chat);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("friendId","friendId");
        result.put("chat","chat");
        return result;
    }
}