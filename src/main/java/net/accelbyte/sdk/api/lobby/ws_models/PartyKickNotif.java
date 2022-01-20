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
public class PartyKickNotif {
    private String partyId;
    private String leaderId;
    private String userId;

    private PartyKickNotif() {

    }

    @Builder
    public PartyKickNotif (
        String partyId,
        String leaderId,
        String userId
    ) {
        this.partyId = partyId;
        this.leaderId = leaderId;
        this.userId = userId;
    }

    public static String getType(){
        return "partyKickNotif";
    }

    public static PartyKickNotif createFromWSM(String message) {
        PartyKickNotif result = new PartyKickNotif();
        Map<String, String> response = parseWSM(message);
        result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
        result.leaderId = response.get("leaderId") != null ? response.get("leaderId") : null;
        result.userId = response.get("userId") != null ? response.get("userId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyKickNotif.getType());
        if (partyId != null) {
            stringBuilder
                    .append("\n")
                    .append("partyId: ")
                    .append(partyId);
        }
        if (leaderId != null) {
            stringBuilder
                    .append("\n")
                    .append("leaderId: ")
                    .append(leaderId);
        }
        if (userId != null) {
            stringBuilder
                    .append("\n")
                    .append("userId: ")
                    .append(userId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("partyId","partyId");
        result.put("leaderId","leaderId");
        result.put("userId","userId");
        return result;
    }
}