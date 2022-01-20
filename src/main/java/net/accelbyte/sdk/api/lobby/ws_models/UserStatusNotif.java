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
public class UserStatusNotif {
    private String userId;
    private Integer availability;
    private String activity;
    private String lastSeenAt;

    private UserStatusNotif() {

    }

    @Builder
    public UserStatusNotif (
        String userId,
        Integer availability,
        String activity,
        String lastSeenAt
    ) {
        this.userId = userId;
        this.availability = availability;
        this.activity = activity;
        this.lastSeenAt = lastSeenAt;
    }

    public static String getType(){
        return "userStatusNotif";
    }

    public static UserStatusNotif createFromWSM(String message) {
        UserStatusNotif result = new UserStatusNotif();
        Map<String, String> response = parseWSM(message);
        result.userId = response.get("userId") != null ? response.get("userId") : null;
        result.availability = response.get("availability") != null ? Integer.valueOf(response.get("availability")) : null;
        result.activity = response.get("activity") != null ? response.get("activity") : null;
        result.lastSeenAt = response.get("lastSeenAt") != null ? response.get("lastSeenAt") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(UserStatusNotif.getType());
        if (userId != null) {
            stringBuilder
                    .append("\n")
                    .append("userId: ")
                    .append(userId);
        }
        if (availability != null) {
            stringBuilder
                    .append("\n")
                    .append("availability: ")
                    .append(availability);
        }
        if (activity != null) {
            stringBuilder
                    .append("\n")
                    .append("activity: ")
                    .append(activity);
        }
        if (lastSeenAt != null) {
            stringBuilder
                    .append("\n")
                    .append("lastSeenAt: ")
                    .append(lastSeenAt);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("userId","userId");
        result.put("availability","availability");
        result.put("activity","activity");
        result.put("lastSeenAt","lastSeenAt");
        return result;
    }
}