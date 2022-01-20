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
public class UserMetricResponse {
    private String id;
    private String code;
    private Integer playerCount;

    private UserMetricResponse() {

    }

    @Builder
    public UserMetricResponse (
        String id,
        String code,
        Integer playerCount
    ) {
        this.id = id;
        this.code = code;
        this.playerCount = playerCount;
    }

    public static String getType(){
        return "userMetricResponse";
    }

    public static UserMetricResponse createFromWSM(String message) {
        UserMetricResponse result = new UserMetricResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.playerCount = response.get("playerCount") != null ? Integer.valueOf(response.get("playerCount")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(UserMetricResponse.getType());
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
        if (playerCount != null) {
            stringBuilder
                    .append("\n")
                    .append("playerCount: ")
                    .append(playerCount);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("playerCount","playerCount");
        return result;
    }
}