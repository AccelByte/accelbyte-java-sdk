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
public class AccountcommonJWTBanV3 extends Model {

    @JsonProperty("ban")
    private String ban;

    @JsonProperty("disabledDate")
    private String disabledDate;

    @JsonProperty("enabled")
    private Boolean enabled;

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("targetedNamespace")
    private String targetedNamespace;

    public AccountcommonJWTBanV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<AccountcommonJWTBanV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountcommonJWTBanV3>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ban", "ban");
        result.put("disabledDate", "disabledDate");
        result.put("enabled", "enabled");
        result.put("endDate", "endDate");
        result.put("targetedNamespace", "targetedNamespace");
        return result;
    }
}