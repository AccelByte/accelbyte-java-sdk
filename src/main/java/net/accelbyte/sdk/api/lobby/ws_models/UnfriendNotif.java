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
public class UnfriendNotif {
    private String friendId;

    private UnfriendNotif() {

    }

    @Builder
    public UnfriendNotif (
        String friendId
    ) {
        this.friendId = friendId;
    }

    public static String getType(){
        return "unfriendNotif";
    }

    public static UnfriendNotif createFromWSM(String message) {
        UnfriendNotif result = new UnfriendNotif();
        Map<String, String> response = parseWSM(message);
        result.friendId = response.get("friendId") != null ? response.get("friendId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(UnfriendNotif.getType());
        if (friendId != null) {
            stringBuilder
                    .append("\n")
                    .append("friendId: ")
                    .append(friendId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("friendId","friendId");
        return result;
    }
}