package net.accelbyte.sdk.api.iam.models;

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
public class ModelInviteUserRequestV3 extends Model {

    @JsonProperty("emailAddresses")
    private List<String> emailAddresses;

    @JsonProperty("isAdmin")
    private Boolean isAdmin;

    @JsonProperty("roles")
    private List<String> roles;

    public ModelInviteUserRequestV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelInviteUserRequestV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelInviteUserRequestV3>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("emailAddresses", "emailAddresses");
        result.put("isAdmin", "isAdmin");
        result.put("roles", "roles");
        return result;
    }
}