package net.accelbyte.sdk.api.dslogmanager.models;

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
public class ModelsRequestMatchParty extends Model {

    @JsonProperty("party_attributes")
    Map<String, ?> partyAttributes;
    @JsonProperty("party_id")
    String partyId;
    @JsonProperty("party_members")
    List<ModelsRequestMatchMember> partyMembers;

    public ModelsRequestMatchParty createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("party_attributes", "partyAttributes");
        result.put("party_id", "partyId");
        result.put("party_members", "partyMembers");
        return result;
    }
}