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
public class MessageNotif {
    private String id;
    private String from;
    private String to;
    private String topic;
    private String payload;
    private Integer sentAt;

    private MessageNotif() {

    }

    @Builder
    public MessageNotif (
        String id,
        String from,
        String to,
        String topic,
        String payload,
        Integer sentAt
    ) {
        this.id = id;
        this.from = from;
        this.to = to;
        this.topic = topic;
        this.payload = payload;
        this.sentAt = sentAt;
    }

    public static String getType(){
        return "messageNotif";
    }

    public static MessageNotif createFromWSM(String message) {
        MessageNotif result = new MessageNotif();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.from = response.get("from") != null ? response.get("from") : null;
        result.to = response.get("to") != null ? response.get("to") : null;
        result.topic = response.get("topic") != null ? response.get("topic") : null;
        result.payload = response.get("payload") != null ? response.get("payload") : null;
        result.sentAt = response.get("sentAt") != null ? Integer.valueOf(response.get("sentAt")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(MessageNotif.getType());
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
        if (from != null) {
            stringBuilder
                    .append("\n")
                    .append("from: ")
                    .append(from);
        }
        if (to != null) {
            stringBuilder
                    .append("\n")
                    .append("to: ")
                    .append(to);
        }
        if (topic != null) {
            stringBuilder
                    .append("\n")
                    .append("topic: ")
                    .append(topic);
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
        result.put("id","id");
        result.put("from","from");
        result.put("to","to");
        result.put("topic","topic");
        result.put("payload","payload");
        result.put("sentAt","sentAt");
        return result;
    }
}