package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserCreateFromInvitationRequestV4 extends Model {

    @JsonProperty("acceptedPolicies")
    List<LegalAcceptedPoliciesRequest> acceptedPolicies;
    @JsonProperty("authType")
    String authType;
    @JsonProperty("country")
    String country;
    @JsonProperty("dateOfBirth")
    String dateOfBirth;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("password")
    String password;
    @JsonProperty("username")
    String username;

    public ModelUserCreateFromInvitationRequestV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("acceptedPolicies", "acceptedPolicies");
        result.put("authType", "authType");
        result.put("country", "country");
        result.put("dateOfBirth", "dateOfBirth");
        result.put("displayName", "displayName");
        result.put("password", "password");
        result.put("username", "username");
        return result;
    }
}