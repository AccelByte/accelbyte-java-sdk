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
public class BlockPlayerResponse {
    private String id;
    private String code;
    private String namespace;
    private String blockUserId;

    private BlockPlayerResponse() {

    }

    @Builder
    public BlockPlayerResponse (
        String id,
        String code,
        String namespace,
        String blockUserId
    ) {
        this.id = id;
        this.code = code;
        this.namespace = namespace;
        this.blockUserId = blockUserId;
    }

    public static String getType(){
        return "blockPlayerResponse";
    }

    public static BlockPlayerResponse createFromWSM(String message) {
        BlockPlayerResponse result = new BlockPlayerResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        result.blockUserId = response.get("blockUserId") != null ? response.get("blockUserId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(BlockPlayerResponse.getType());
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
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        if (blockUserId != null) {
            stringBuilder
                    .append("\n")
                    .append("blockUserId: ")
                    .append(blockUserId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("namespace","namespace");
        result.put("blockUserId","blockUserId");
        return result;
    }
}