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
public class RequestFriendsRequest {
    private String id;
    private String friendId;

    private RequestFriendsRequest() {

    }

    @Builder
    public RequestFriendsRequest (
        String id,
        String friendId
    ) {
        this.id = id;
        this.friendId = friendId;
    }

    public static String getType(){
        return "requestFriendsRequest";
    }

    public static RequestFriendsRequest createFromWSM(String message) {
        RequestFriendsRequest result = new RequestFriendsRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.friendId = response.get("friendId") != null ? response.get("friendId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(RequestFriendsRequest.getType());
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
        if (friendId != null) {
            stringBuilder
                    .append("\n")
                    .append("friendId: ")
                    .append(friendId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("friendId","friendId");
        return result;
    }
}