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
public class PartyDataUpdateNotif {
    private String partyId;
    private String leader;
    private String namespace;
    private List<String> members;
    private List<String> invitees;
    private Map<String, ?> customAttributes;
    private Integer updatedAt;

    private PartyDataUpdateNotif() {

    }

    @Builder
    public PartyDataUpdateNotif (
        String partyId,
        String leader,
        String namespace,
        List<String> members,
        List<String> invitees,
        Map<String, ?> customAttributes,
        Integer updatedAt
    ) {
        this.partyId = partyId;
        this.leader = leader;
        this.namespace = namespace;
        this.members = members;
        this.invitees = invitees;
        this.customAttributes = customAttributes;
        this.updatedAt = updatedAt;
    }

    public static String getType(){
        return "partyDataUpdateNotif";
    }

    public static PartyDataUpdateNotif createFromWSM(String message) {
        PartyDataUpdateNotif result = new PartyDataUpdateNotif();
        Map<String, String> response = parseWSM(message);
        result.partyId = response.get("partyId") != null ? response.get("partyId") : null;
        result.leader = response.get("leader") != null ? response.get("leader") : null;
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        result.members = response.get("members") != null ? convertWSMListToListString(response.get("members")) : null;
        result.invitees = response.get("invitees") != null ? convertWSMListToListString(response.get("invitees")) : null;
        result.customAttributes = response.get("customAttributes") != null ? convertJsonToMap(response.get("customAttributes")) : null;
        result.updatedAt = response.get("updatedAt") != null ? Integer.valueOf(response.get("updatedAt")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyDataUpdateNotif.getType());
        if (partyId != null) {
            stringBuilder
                    .append("\n")
                    .append("partyId: ")
                    .append(partyId);
        }
        if (leader != null) {
            stringBuilder
                    .append("\n")
                    .append("leader: ")
                    .append(leader);
        }
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        if (members != null) {
            stringBuilder
                    .append("\n")
                    .append("members: ")
                    .append(listToWSMList(members));
        }
        if (invitees != null) {
            stringBuilder
                    .append("\n")
                    .append("invitees: ")
                    .append(listToWSMList(invitees));
        }
        if (customAttributes != null) {
            try {
                String json = new ObjectMapper().writeValueAsString(customAttributes);
                stringBuilder
                    .append("\n")
                    .append("customAttributes: ")
                    .append(json);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        if (updatedAt != null) {
            stringBuilder
                    .append("\n")
                    .append("updatedAt: ")
                    .append(updatedAt);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("partyId","partyId");
        result.put("leader","leader");
        result.put("namespace","namespace");
        result.put("members","members");
        result.put("invitees","invitees");
        result.put("customAttributes","customAttributes");
        result.put("updatedAt","updatedAt");
        return result;
    }
}