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
public class PartyKickRequest {
    private String id;
    private String memberId;

    private PartyKickRequest() {

    }

    @Builder
    public PartyKickRequest (
        String id,
        String memberId
    ) {
        this.id = id;
        this.memberId = memberId;
    }

    public static String getType(){
        return "partyKickRequest";
    }

    public static PartyKickRequest createFromWSM(String message) {
        PartyKickRequest result = new PartyKickRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.memberId = response.get("memberId") != null ? response.get("memberId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyKickRequest.getType());
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
        if (memberId != null) {
            stringBuilder
                    .append("\n")
                    .append("memberId: ")
                    .append(memberId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("memberId","memberId");
        return result;
    }
}