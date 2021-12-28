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
public class ModelUpgradeHeadlessAccountWithVerificationCodeRequest extends Model {

    @JsonProperty("Code")
    String code;
    @JsonProperty("Password")
    String password;
    @JsonProperty("loginId")
    String loginId;

    public ModelUpgradeHeadlessAccountWithVerificationCodeRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Code", "code");
        result.put("Password", "password");
        result.put("loginId", "loginId");
        return result;
    }
}