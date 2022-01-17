package net.accelbyte.sdk.api.lobby.ws_models;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

import static net.accelbyte.sdk.core.util.Helper.generateUUID;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;

@Getter
@Setter
public class JoinDefaultChannelResponse {
    private String channelSlug;
    private String code;
    private String id;

    private JoinDefaultChannelResponse() {
    }

    @Builder
    public JoinDefaultChannelResponse(String channelSlug, String code, String id) {
        this.channelSlug = channelSlug;
        this.code = code;
        this.id = id;
    }

    public static String getType() {
        return "joinDefaultChannelResponse";
    }

    public static JoinDefaultChannelResponse createFromWSM(String message) {
        JoinDefaultChannelResponse result = new JoinDefaultChannelResponse();
        Map<String, String> response = parseWSM(message);
        if (response.get("channelSlug") != null) {
            result.channelSlug = response.get("channelSlug");
        }
        if (response.get("code") != null) {
            result.code = response.get("code");
        }
        if (response.get("id") != null) {
            result.id = response.get("id");
        }
        return result;
    }

    public static String toWSM(JoinDefaultChannelResponse joinDefaultChannelResponse) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(JoinDefaultChannelResponse.getType());
        if (joinDefaultChannelResponse.channelSlug != null) {
            stringBuilder
                    .append("\n")
                    .append("channelSlug: ")
                    .append(joinDefaultChannelResponse.channelSlug);
        }
        if (joinDefaultChannelResponse.code != null) {
            stringBuilder
                    .append("\n")
                    .append("code: ")
                    .append(joinDefaultChannelResponse.code);
        }
        if (joinDefaultChannelResponse.id != null) {
            stringBuilder
                    .append("\n")
                    .append("id: ")
                    .append(joinDefaultChannelResponse.id);
        } else {
            stringBuilder
                    .append("\n")
                    .append("id: ")
                    .append(generateUUID());
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("channelSlug", "channelSlug");
        result.put("code", "code");
        result.put("id", "id");
        return result;
    }
}
