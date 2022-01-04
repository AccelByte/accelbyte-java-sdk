package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class ModelUserCreateResponse extends Model {

    @JsonProperty("AuthType")
    private String authType;

    @JsonProperty("Country")
    private String country;

    @JsonProperty("DateOfBirth")
    private String dateOfBirth;

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("LoginId")
    private String loginId;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("UserId")
    private String userId;

    @JsonIgnore
    public ModelUserCreateResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserCreateResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserCreateResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AuthType", "authType");
        result.put("Country", "country");
        result.put("DateOfBirth", "dateOfBirth");
        result.put("DisplayName", "displayName");
        result.put("LoginId", "loginId");
        result.put("Namespace", "namespace");
        result.put("UserId", "userId");
        return result;
    }
}