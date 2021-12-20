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
public class ModelUserCreateRequest extends Model {

    @JsonProperty("AuthType")
    String authType;
    @JsonProperty("Country")
    String country;
    @JsonProperty("DisplayName")
    String displayName;
    @JsonProperty("LoginId")
    String loginId;
    @JsonProperty("Password")
    String password;
    @JsonProperty("PasswordMD5Sum")
    String passwordMD5Sum;

    public ModelUserCreateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AuthType", "authType");
        result.put("Country", "country");
        result.put("DisplayName", "displayName");
        result.put("LoginId", "loginId");
        result.put("Password", "password");
        result.put("PasswordMD5Sum", "passwordMD5Sum");
        return result;
    }
}