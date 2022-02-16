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
public class BlockPlayerNotif {
    private String userId;
    private String blockedUserId;

    private BlockPlayerNotif() {

    }

    @Builder
    public BlockPlayerNotif (
        String userId,
        String blockedUserId
    ) {
        this.userId = userId;
        this.blockedUserId = blockedUserId;
    }

    public static String getType(){
        return "blockPlayerNotif";
    }

    public static BlockPlayerNotif createFromWSM(String message) {
        BlockPlayerNotif result = new BlockPlayerNotif();
        Map<String, String> response = parseWSM(message);
        result.userId = response.get("userId") != null ? response.get("userId") : null;
        result.blockedUserId = response.get("blockedUserId") != null ? response.get("blockedUserId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(BlockPlayerNotif.getType());
        if (userId != null) {
            stringBuilder
                    .append("\n")
                    .append("userId: ")
                    .append(userId);
        }
        if (blockedUserId != null) {
            stringBuilder
                    .append("\n")
                    .append("blockedUserId: ")
                    .append(blockedUserId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("userId","userId");
        result.put("blockedUserId","blockedUserId");
        return result;
    }
}