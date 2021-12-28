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
public class ModelUserInvitationV3 extends Model {

    @JsonProperty("email")
    private String email;

    @JsonProperty("expiredAt")
    private String expiredAt;

    @JsonProperty("id")
    private String id;

    @JsonProperty("roles")
    private List<AccountcommonNamespaceRole> roles;

    public ModelUserInvitationV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelUserInvitationV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserInvitationV3>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("email", "email");
        result.put("expiredAt", "expiredAt");
        result.put("id", "id");
        result.put("roles", "roles");
        return result;
    }
}