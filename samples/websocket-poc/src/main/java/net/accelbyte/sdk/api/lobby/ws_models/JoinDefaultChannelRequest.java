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
public class JoinDefaultChannelRequest {
    private String id;

    private JoinDefaultChannelRequest() {
    }

    @Builder
    public JoinDefaultChannelRequest(String id) {
        this.id = id;
    }

    public static String getType() {
        return "joinDefaultChannelRequest";
    }

    public static JoinDefaultChannelRequest createFromWSM(String message) {
        JoinDefaultChannelRequest result = new JoinDefaultChannelRequest();
        Map<String, String> response = parseWSM(message);
        if (response.get("id") != null) {
            result.id = response.get("id");
        }
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(JoinDefaultChannelRequest.getType());
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
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id", "id");
        return result;
    }
}
