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
public class ClientmodelClientV3Response extends Model {

    @JsonProperty("audiences")
    private List<String> audiences;

    @JsonProperty("baseUri")
    private String baseUri;

    @JsonProperty("clientId")
    private String clientId;

    @JsonProperty("clientName")
    private String clientName;

    @JsonProperty("clientPermissions")
    private List<AccountcommonPermissionV3> clientPermissions;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("modifiedAt")
    private String modifiedAt;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("oauthClientType")
    private String oauthClientType;

    @JsonProperty("redirectUri")
    private String redirectUri;

    @JsonProperty("scopes")
    private List<String> scopes;

    @JsonIgnore
    public ClientmodelClientV3Response createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ClientmodelClientV3Response> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ClientmodelClientV3Response>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("audiences", "audiences");
        result.put("baseUri", "baseUri");
        result.put("clientId", "clientId");
        result.put("clientName", "clientName");
        result.put("clientPermissions", "clientPermissions");
        result.put("createdAt", "createdAt");
        result.put("modifiedAt", "modifiedAt");
        result.put("namespace", "namespace");
        result.put("oauthClientType", "oauthClientType");
        result.put("redirectUri", "redirectUri");
        result.put("scopes", "scopes");
        return result;
    }
}