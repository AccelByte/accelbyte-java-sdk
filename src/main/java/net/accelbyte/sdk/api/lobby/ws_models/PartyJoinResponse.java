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
public class PartyJoinResponse {
    private String id;
    private String code;
    private String partyId;
    private String leaderId;
    private String members;
    private String invitees;
    private String invitationToken;

    private PartyJoinResponse() {

    }

    @Builder
    public PartyJoinResponse (
        String id,
        String code,
        String partyId,
        String leaderId,
        String members,
        String invitees,
        String invitationToken
    ) {
        this.id = id;
        this.code = code;
        this.partyId = partyId;
        this.leaderId = leaderId;
        this.members = members;
        this.invitees = invitees;
        this.invitationToken = invitationToken;
    }

    public static String getType(){
        return "partyJoinResponse";
    }

    public static PartyJoinResponse createFromWSM(String message) {
        PartyJoinResponse result = new PartyJoinResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
        result.leaderId = response.get("leaderId") != null ? response.get("leaderId") : null;
        result.members = response.get("members") != null ? response.get("members") : null;
        result.invitees = response.get("invitees") != null ? response.get("invitees") : null;
        result.invitationToken = response.get("invitationToken") != null ? response.get("invitationToken") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyJoinResponse.getType());
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
        if (members != null) {
            stringBuilder
                    .append("\n")
                    .append("members: ")
                    .append(members);
        }
        if (invitees != null) {
            stringBuilder
                    .append("\n")
                    .append("invitees: ")
                    .append(invitees);
        }
        if (invitationToken != null) {
            stringBuilder
                    .append("\n")
                    .append("invitationToken: ")
                    .append(invitationToken);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("partyId","partyId");
        result.put("leaderId","leaderId");
        result.put("members","members");
        result.put("invitees","invitees");
        result.put("invitationToken","invitationToken");
        return result;
    }
}