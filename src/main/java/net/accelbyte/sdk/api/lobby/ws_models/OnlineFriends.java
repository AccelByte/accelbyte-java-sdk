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
public class OnlineFriends {
    private String id;
    private String code;
    private List<String> onlineFriendIds;

    private OnlineFriends() {

    }

    @Builder
    public OnlineFriends (
        String id,
        String code,
        List<String> onlineFriendIds
    ) {
        this.id = id;
        this.code = code;
        this.onlineFriendIds = onlineFriendIds;
    }

    public static String getType(){
        return "onlineFriends";
    }

    public static OnlineFriends createFromWSM(String message) {
        OnlineFriends result = new OnlineFriends();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.onlineFriendIds = response.get("onlineFriendIds") != null ? convertWSMListToListString(response.get("onlineFriendIds")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(OnlineFriends.getType());
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
        if (onlineFriendIds != null) {
            stringBuilder
                    .append("\n")
                    .append("onlineFriendIds: ")
                    .append(listToWSMList(onlineFriendIds));
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("onlineFriendIds","onlineFriendIds");
        return result;
    }
}