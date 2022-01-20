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
public class PersonalChatNotif {
    private String id;
    private String from;
    private String to;
    private String payload;
    private Integer receivedAt;

    private PersonalChatNotif() {

    }

    @Builder
    public PersonalChatNotif (
        String id,
        String from,
        String to,
        String payload,
        Integer receivedAt
    ) {
        this.id = id;
        this.from = from;
        this.to = to;
        this.payload = payload;
        this.receivedAt = receivedAt;
    }

    public static String getType(){
        return "personalChatNotif";
    }

    public static PersonalChatNotif createFromWSM(String message) {
        PersonalChatNotif result = new PersonalChatNotif();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.from = response.get("from") != null ? response.get("from") : null;
        result.to = response.get("to") != null ? response.get("to") : null;
        result.payload = response.get("payload") != null ? response.get("payload") : null;
        result.receivedAt = response.get("receivedAt") != null ? Integer.valueOf(response.get("receivedAt")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PersonalChatNotif.getType());
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
        if (payload != null) {
            stringBuilder
                    .append("\n")
                    .append("payload: ")
                    .append(payload);
        }
        if (receivedAt != null) {
            stringBuilder
                    .append("\n")
                    .append("receivedAt: ")
                    .append(receivedAt);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("from","from");
        result.put("to","to");
        result.put("payload","payload");
        result.put("receivedAt","receivedAt");
        return result;
    }
}