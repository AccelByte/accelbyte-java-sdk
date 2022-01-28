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
public class AcceptFriendsNotif {
    private String friendId;

    private AcceptFriendsNotif() {

    }

    @Builder
    public AcceptFriendsNotif (
        String friendId
    ) {
        this.friendId = friendId;
    }

    public static String getType(){
        return "acceptFriendsNotif";
    }

    public static AcceptFriendsNotif createFromWSM(String message) {
        AcceptFriendsNotif result = new AcceptFriendsNotif();
        Map<String, String> response = parseWSM(message);
        result.friendId = response.get("friendId") != null ? response.get("friendId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(AcceptFriendsNotif.getType());
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