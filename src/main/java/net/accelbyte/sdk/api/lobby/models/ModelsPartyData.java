package net.accelbyte.sdk.api.lobby.models;

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
public class ModelsPartyData extends Model {

    @JsonProperty("custom_attribute")
    Map<String, ?> customAttribute;
    @JsonProperty("invitees")
    List<String> invitees;
    @JsonProperty("leader")
    String leader;
    @JsonProperty("members")
    List<String> members;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("partyId")
    String partyId;
    @JsonProperty("updatedAt")
    Integer updatedAt;

    public ModelsPartyData createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("custom_attribute", "customAttribute");
        result.put("invitees", "invitees");
        result.put("leader", "leader");
        result.put("members", "members");
        result.put("namespace", "namespace");
        result.put("partyId", "partyId");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}