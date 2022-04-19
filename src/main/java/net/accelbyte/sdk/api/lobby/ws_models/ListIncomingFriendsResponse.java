/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
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
public class ListIncomingFriendsResponse {
    private Integer code;
    private String id;
    private List<String> userIds;

    private ListIncomingFriendsResponse() {

    }

    @Builder
    public ListIncomingFriendsResponse (
        Integer code,
        String id,
        List<String> userIds
    ) {
        this.code = code;
        this.id = id;
        this.userIds = userIds;
    }

    public static String getType(){
        return "listIncomingFriendsResponse";
    }

    public static ListIncomingFriendsResponse createFromWSM(String message) {
        ListIncomingFriendsResponse result = new ListIncomingFriendsResponse();
        Map<String, String> response = parseWSM(message);
        result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
        result.id = response.get("id") != null ? response.get("id") : null;
        result.userIds = response.get("userIds") != null ? convertWSMListToListString(response.get("userIds")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ListIncomingFriendsResponse.getType());
        if (code != null) {
            stringBuilder
                    .append("\n")
                    .append("code: ")
                    .append(code);
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
        if (userIds != null) {
            stringBuilder
                    .append("\n")
                    .append("userIds: ")
                    .append(listToWSMList(userIds));
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code","code");
        result.put("id","id");
        result.put("userIds","userIds");
        return result;
    }
}