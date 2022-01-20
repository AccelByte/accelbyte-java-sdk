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
public class SendChannelChatRequest {
    private String id;
    private String channelSlug;
    private String payload;

    private SendChannelChatRequest() {

    }

    @Builder
    public SendChannelChatRequest (
        String id,
        String channelSlug,
        String payload
    ) {
        this.id = id;
        this.channelSlug = channelSlug;
        this.payload = payload;
    }

    public static String getType(){
        return "sendChannelChatRequest";
    }

    public static SendChannelChatRequest createFromWSM(String message) {
        SendChannelChatRequest result = new SendChannelChatRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.channelSlug = response.get("channelSlug") != null ? response.get("channelSlug") : null;
        result.payload = response.get("payload") != null ? response.get("payload") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(SendChannelChatRequest.getType());
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
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("channelSlug","channelSlug");
        result.put("payload","payload");
        return result;
    }
}