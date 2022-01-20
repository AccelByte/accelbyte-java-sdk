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
public class FriendsStatusResponse {
    private String id;
    private String code;
    private List<String> friendIds;
    private List<Integer> availability;
    private List<String> activity;
    private List<String> lastSeenAt;

    private FriendsStatusResponse() {

    }

    @Builder
    public FriendsStatusResponse (
        String id,
        String code,
        List<String> friendIds,
        List<Integer> availability,
        List<String> activity,
        List<String> lastSeenAt
    ) {
        this.id = id;
        this.code = code;
        this.friendIds = friendIds;
        this.availability = availability;
        this.activity = activity;
        this.lastSeenAt = lastSeenAt;
    }

    public static String getType(){
        return "friendsStatusResponse";
    }

    public static FriendsStatusResponse createFromWSM(String message) {
        FriendsStatusResponse result = new FriendsStatusResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.friendIds = response.get("friendIds") != null ? convertWSMListToListString(response.get("friendIds")) : null;
        result.availability = response.get("availability") != null ? convertWSMListToListInteger(response.get("availability")) : null;
        result.activity = response.get("activity") != null ? convertWSMListToListString(response.get("activity")) : null;
        result.lastSeenAt = response.get("lastSeenAt") != null ? convertWSMListToListString(response.get("lastSeenAt")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(FriendsStatusResponse.getType());
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
        if (availability != null) {
            stringBuilder
                    .append("\n")
                    .append("availability: ")
                    .append(listToWSMList(availability));
        }
        if (activity != null) {
            stringBuilder
                    .append("\n")
                    .append("activity: ")
                    .append(listToWSMList(activity));
        }
        if (lastSeenAt != null) {
            stringBuilder
                    .append("\n")
                    .append("lastSeenAt: ")
                    .append(listToWSMList(lastSeenAt));
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("friendIds","friendIds");
        result.put("availability","availability");
        result.put("activity","activity");
        result.put("lastSeenAt","lastSeenAt");
        return result;
    }
}