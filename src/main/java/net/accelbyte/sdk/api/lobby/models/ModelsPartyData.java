package net.accelbyte.sdk.api.lobby.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
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
    private Map<String, ?> customAttribute;

    @JsonProperty("invitees")
    private List<String> invitees;

    @JsonProperty("leader")
    private String leader;

    @JsonProperty("members")
    private List<String> members;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("partyId")
    private String partyId;

    @JsonProperty("updatedAt")
    private Integer updatedAt;

    public ModelsPartyData createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsPartyData> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPartyData>>() {});
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