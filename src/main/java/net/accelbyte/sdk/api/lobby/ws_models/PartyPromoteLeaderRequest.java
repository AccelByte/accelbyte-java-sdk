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
public class PartyPromoteLeaderRequest {
    private String id;
    private String newLeaderUserId;

    private PartyPromoteLeaderRequest() {

    }

    @Builder
    public PartyPromoteLeaderRequest (
        String id,
        String newLeaderUserId
    ) {
        this.id = id;
        this.newLeaderUserId = newLeaderUserId;
    }

    public static String getType(){
        return "partyPromoteLeaderRequest";
    }

    public static PartyPromoteLeaderRequest createFromWSM(String message) {
        PartyPromoteLeaderRequest result = new PartyPromoteLeaderRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.newLeaderUserId = response.get("newLeaderUserId") != null ? response.get("newLeaderUserId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyPromoteLeaderRequest.getType());
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
        if (newLeaderUserId != null) {
            stringBuilder
                    .append("\n")
                    .append("newLeaderUserId: ")
                    .append(newLeaderUserId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("newLeaderUserId","newLeaderUserId");
        return result;
    }
}