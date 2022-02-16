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
public class ChannelChatNotif {
    private String from;
    private String channelSlug;
    private String payload;
    private String sentAt;

    private ChannelChatNotif() {

    }

    @Builder
    public ChannelChatNotif (
        String from,
        String channelSlug,
        String payload,
        String sentAt
    ) {
        this.from = from;
        this.channelSlug = channelSlug;
        this.payload = payload;
        this.sentAt = sentAt;
    }

    public static String getType(){
        return "channelChatNotif";
    }

    public static ChannelChatNotif createFromWSM(String message) {
        ChannelChatNotif result = new ChannelChatNotif();
        Map<String, String> response = parseWSM(message);
        result.from = response.get("from") != null ? response.get("from") : null;
        result.channelSlug = response.get("channelSlug") != null ? response.get("channelSlug") : null;
        result.payload = response.get("payload") != null ? response.get("payload") : null;
        result.sentAt = response.get("sentAt") != null ? response.get("sentAt") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ChannelChatNotif.getType());
        if (from != null) {
            stringBuilder
                    .append("\n")
                    .append("from: ")
                    .append(from);
        }
        if (channelSlug != null) {
            stringBuilder
                    .append("\n")
                    .append("channelSlug: ")
                    .append(channelSlug);
        }
        if (payload != null) {
            stringBuilder
                    .append("\n")
                    .append("payload: ")
                    .append(payload);
        }
        if (sentAt != null) {
            stringBuilder
                    .append("\n")
                    .append("sentAt: ")
                    .append(sentAt);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("from","from");
        result.put("channelSlug","channelSlug");
        result.put("payload","payload");
        result.put("sentAt","sentAt");
        return result;
    }
}