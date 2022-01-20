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
public class JoinDefaultChannelResponse {
    private String id;
    private String code;
    private String channelSlug;

    private JoinDefaultChannelResponse() {

    }

    @Builder
    public JoinDefaultChannelResponse (
        String id,
        String code,
        String channelSlug
    ) {
        this.id = id;
        this.code = code;
        this.channelSlug = channelSlug;
    }

    public static String getType(){
        return "joinDefaultChannelResponse";
    }

    public static JoinDefaultChannelResponse createFromWSM(String message) {
        JoinDefaultChannelResponse result = new JoinDefaultChannelResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.channelSlug = response.get("channelSlug") != null ? response.get("channelSlug") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(JoinDefaultChannelResponse.getType());
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
        if (channelSlug != null) {
            stringBuilder
                    .append("\n")
                    .append("channelSlug: ")
                    .append(channelSlug);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("channelSlug","channelSlug");
        return result;
    }
}