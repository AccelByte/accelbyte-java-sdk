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
public class ClientmodelClientUpdateV3Request extends Model {

    @JsonProperty("audiences")
    private List<String> audiences;

    @JsonProperty("baseUri")
    private String baseUri;

    @JsonProperty("clientName")
    private String clientName;

    @JsonProperty("clientPermissions")
    private List<AccountcommonPermissionV3> clientPermissions;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("redirectUri")
    private String redirectUri;

    @JsonIgnore
    public ClientmodelClientUpdateV3Request createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ClientmodelClientUpdateV3Request> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ClientmodelClientUpdateV3Request>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("audiences", "audiences");
        result.put("baseUri", "baseUri");
        result.put("clientName", "clientName");
        result.put("clientPermissions", "clientPermissions");
        result.put("namespace", "namespace");
        result.put("redirectUri", "redirectUri");
        return result;
    }
}