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
public class ModelVerificationCodeResponse extends Model {

    @JsonProperty("accountRegistration")
    private String accountRegistration;

    @JsonProperty("accountUpgrade")
    private String accountUpgrade;

    @JsonProperty("passwordReset")
    private String passwordReset;

    @JsonProperty("updateEmail")
    private String updateEmail;

    public ModelVerificationCodeResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelVerificationCodeResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelVerificationCodeResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("accountRegistration", "accountRegistration");
        result.put("accountUpgrade", "accountUpgrade");
        result.put("passwordReset", "passwordReset");
        result.put("updateEmail", "updateEmail");
        return result;
    }
}