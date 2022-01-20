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
public class ListIncomingFriendsResponse {
    private String id;
    private String code;
    private List<String> userIds;

    private ListIncomingFriendsResponse() {

    }

    @Builder
    public ListIncomingFriendsResponse (
        String id,
        String code,
        List<String> userIds
    ) {
        this.id = id;
        this.code = code;
        this.userIds = userIds;
    }

    public static String getType(){
        return "listIncomingFriendsResponse";
    }

    public static ListIncomingFriendsResponse createFromWSM(String message) {
        ListIncomingFriendsResponse result = new ListIncomingFriendsResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.userIds = response.get("userIds") != null ? convertWSMListToListString(response.get("userIds")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ListIncomingFriendsResponse.getType());
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
        if (userIds != null) {
            stringBuilder
                    .append("\n")
                    .append("userIds: ")
                    .append(listToWSMList(userIds));
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("userIds","userIds");
        return result;
    }
}