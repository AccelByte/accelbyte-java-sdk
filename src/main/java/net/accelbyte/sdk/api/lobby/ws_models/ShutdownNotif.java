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
public class ShutdownNotif {
    private String message;

    private ShutdownNotif() {

    }

    @Builder
    public ShutdownNotif (
        String message
    ) {
        this.message = message;
    }

    public static String getType(){
        return "shutdownNotif";
    }

    public static ShutdownNotif createFromWSM(String message) {
        ShutdownNotif result = new ShutdownNotif();
        Map<String, String> response = parseWSM(message);
        result.message = response.get("message") != null ? response.get("message") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ShutdownNotif.getType());
        if (message != null) {
            stringBuilder
                    .append("\n")
                    .append("message: ")
                    .append(message);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("message","message");
        return result;
    }
}