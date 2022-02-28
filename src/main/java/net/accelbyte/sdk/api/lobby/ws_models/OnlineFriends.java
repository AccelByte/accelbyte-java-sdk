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
public class OnlineFriends {
    private Integer code;
    private String id;
    private List<String> onlineFriendIds;

    private OnlineFriends() {

    }

    @Builder
    public OnlineFriends (
        Integer code,
        String id,
        List<String> onlineFriendIds
    ) {
        this.code = code;
        this.id = id;
        this.onlineFriendIds = onlineFriendIds;
    }

    public static String getType(){
        return "onlineFriends";
    }

    public static OnlineFriends createFromWSM(String message) {
        OnlineFriends result = new OnlineFriends();
        Map<String, String> response = parseWSM(message);
        result.code = response.get("code") != null ? Integer.valueOf(response.get("code")) : null;
        result.id = response.get("id") != null ? response.get("id") : null;
        result.onlineFriendIds = response.get("onlineFriendIds") != null ? convertWSMListToListString(response.get("onlineFriendIds")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(OnlineFriends.getType());
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
        if (onlineFriendIds != null) {
            stringBuilder
                    .append("\n")
                    .append("onlineFriendIds: ")
                    .append(listToWSMList(onlineFriendIds));
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code","code");
        result.put("id","id");
        result.put("onlineFriendIds","onlineFriendIds");
        return result;
    }
}