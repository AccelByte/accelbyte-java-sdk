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
public class ListOutgoingFriendsResponse {
    private String id;
    private String code;
    private List<String> friendIds;

    private ListOutgoingFriendsResponse() {

    }

    @Builder
    public ListOutgoingFriendsResponse (
        String id,
        String code,
        List<String> friendIds
    ) {
        this.id = id;
        this.code = code;
        this.friendIds = friendIds;
    }

    public static String getType(){
        return "listOutgoingFriendsResponse";
    }

    public static ListOutgoingFriendsResponse createFromWSM(String message) {
        ListOutgoingFriendsResponse result = new ListOutgoingFriendsResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.friendIds = response.get("friendIds") != null ? convertWSMListToListString(response.get("friendIds")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ListOutgoingFriendsResponse.getType());
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
        if (friendIds != null) {
            stringBuilder
                    .append("\n")
                    .append("friendIds: ")
                    .append(listToWSMList(friendIds));
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("friendIds","friendIds");
        return result;
    }
}