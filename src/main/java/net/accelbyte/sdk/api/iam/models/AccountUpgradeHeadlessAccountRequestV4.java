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
public class AccountUpgradeHeadlessAccountRequestV4 extends Model {

    @JsonProperty("emailAddress")
    String emailAddress;
    @JsonProperty("password")
    String password;
    @JsonProperty("username")
    String username;

    public AccountUpgradeHeadlessAccountRequestV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("emailAddress", "emailAddress");
        result.put("password", "password");
        result.put("username", "username");
        return result;
    }
}