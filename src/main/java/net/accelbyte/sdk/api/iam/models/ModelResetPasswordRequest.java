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
public class ModelResetPasswordRequest extends Model {

    @JsonProperty("Code")
    String code;
    @JsonProperty("LoginID")
    String loginID;
    @JsonProperty("NewPassword")
    String newPassword;

    public ModelResetPasswordRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Code", "code");
        result.put("LoginID", "loginID");
        result.put("NewPassword", "newPassword");
        return result;
    }
}