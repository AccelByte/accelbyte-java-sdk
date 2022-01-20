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
public class GetFriendshipStatusResponse {
    private String id;
    private String code;
    private String friendshipStatus;

    private GetFriendshipStatusResponse() {

    }

    @Builder
    public GetFriendshipStatusResponse (
        String id,
        String code,
        String friendshipStatus
    ) {
        this.id = id;
        this.code = code;
        this.friendshipStatus = friendshipStatus;
    }

    public static String getType(){
        return "getFriendshipStatusResponse";
    }

    public static GetFriendshipStatusResponse createFromWSM(String message) {
        GetFriendshipStatusResponse result = new GetFriendshipStatusResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.friendshipStatus = response.get("friendshipStatus") != null ? response.get("friendshipStatus") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(GetFriendshipStatusResponse.getType());
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
        if (friendshipStatus != null) {
            stringBuilder
                    .append("\n")
                    .append("friendshipStatus: ")
                    .append(friendshipStatus);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("friendshipStatus","friendshipStatus");
        return result;
    }
}