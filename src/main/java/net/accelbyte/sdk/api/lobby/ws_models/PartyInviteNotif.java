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
public class PartyInviteNotif {
    private String inviterId;
    private String inviteeId;

    private PartyInviteNotif() {

    }

    @Builder
    public PartyInviteNotif (
        String inviterId,
        String inviteeId
    ) {
        this.inviterId = inviterId;
        this.inviteeId = inviteeId;
    }

    public static String getType(){
        return "partyInviteNotif";
    }

    public static PartyInviteNotif createFromWSM(String message) {
        PartyInviteNotif result = new PartyInviteNotif();
        Map<String, String> response = parseWSM(message);
        result.inviterId = response.get("inviterId") != null ? response.get("inviterId") : null;
        result.inviteeId = response.get("inviteeId") != null ? response.get("inviteeId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyInviteNotif.getType());
        if (inviterId != null) {
            stringBuilder
                    .append("\n")
                    .append("inviterId: ")
                    .append(inviterId);
        }
        if (inviteeId != null) {
            stringBuilder
                    .append("\n")
                    .append("inviteeId: ")
                    .append(inviteeId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("inviterId","inviterId");
        result.put("inviteeId","inviteeId");
        return result;
    }
}