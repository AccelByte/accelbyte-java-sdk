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
public class ModelUserInformation extends Model {

    @JsonProperty("Country")
    private String country;

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("EmailAddresses")
    private List<String> emailAddresses;

    @JsonProperty("LinkedPlatformAccounts")
    private List<ModelPlatformUserInformation> linkedPlatformAccounts;

    @JsonProperty("PhoneNumber")
    private String phoneNumber;

    @JsonProperty("Username")
    private String username;

    @JsonProperty("XUID")
    private String xuid;

    public ModelUserInformation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelUserInformation> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserInformation>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Country", "country");
        result.put("DisplayName", "displayName");
        result.put("EmailAddresses", "emailAddresses");
        result.put("LinkedPlatformAccounts", "linkedPlatformAccounts");
        result.put("PhoneNumber", "phoneNumber");
        result.put("Username", "username");
        result.put("XUID", "xuid");
        return result;
    }
}