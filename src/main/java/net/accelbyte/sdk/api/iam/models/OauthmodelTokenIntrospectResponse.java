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
public class OauthmodelTokenIntrospectResponse extends Model {

    @JsonProperty("active")
    private Boolean active;

    @JsonProperty("aud")
    private String aud;

    @JsonProperty("client_id")
    private String clientId;

    @JsonProperty("exp")
    private Integer exp;

    @JsonProperty("iat")
    private Integer iat;

    @JsonProperty("scope")
    private String scope;

    @JsonProperty("sub")
    private String sub;

    @JsonIgnore
    public OauthmodelTokenIntrospectResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<OauthmodelTokenIntrospectResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<OauthmodelTokenIntrospectResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("active", "active");
        result.put("aud", "aud");
        result.put("client_id", "clientId");
        result.put("exp", "exp");
        result.put("iat", "iat");
        result.put("scope", "scope");
        result.put("sub", "sub");
        return result;
    }
}