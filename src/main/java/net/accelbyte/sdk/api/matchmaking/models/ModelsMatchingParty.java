package net.accelbyte.sdk.api.matchmaking.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class ModelsMatchingParty extends Model {

    @JsonProperty("first_ticket_created_at")
    Integer firstTicketCreatedAt;
    @JsonProperty("party_attributes")
    Map<String, ?> partyAttributes;
    @JsonProperty("party_id")
    String partyId;
    @JsonProperty("party_members")
    List<ModelsPartyMember> partyMembers;

    public ModelsMatchingParty createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("first_ticket_created_at", "firstTicketCreatedAt");
        result.put("party_attributes", "partyAttributes");
        result.put("party_id", "partyId");
        result.put("party_members", "partyMembers");
        return result;
    }
}