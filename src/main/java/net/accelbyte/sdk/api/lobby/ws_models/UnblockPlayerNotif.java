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
public class UnblockPlayerNotif {
    private String unblockedUserId;
    private String userId;

    private UnblockPlayerNotif() {

    }

    @Builder
    public UnblockPlayerNotif (
        String unblockedUserId,
        String userId
    ) {
        this.unblockedUserId = unblockedUserId;
        this.userId = userId;
    }

    public static String getType(){
        return "unblockPlayerNotif";
    }

    public static UnblockPlayerNotif createFromWSM(String message) {
        UnblockPlayerNotif result = new UnblockPlayerNotif();
        Map<String, String> response = parseWSM(message);
        result.unblockedUserId = response.get("unblockedUserId") != null ? response.get("unblockedUserId") : null;
        result.userId = response.get("userId") != null ? response.get("userId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(UnblockPlayerNotif.getType());
        if (unblockedUserId != null) {
            stringBuilder
                    .append("\n")
                    .append("unblockedUserId: ")
                    .append(unblockedUserId);
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
        result.put("unblockedUserId","unblockedUserId");
        result.put("userId","userId");
        return result;
    }
}