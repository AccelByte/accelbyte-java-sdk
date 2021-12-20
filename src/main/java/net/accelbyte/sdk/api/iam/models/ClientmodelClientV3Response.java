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
public class ClientmodelClientV3Response extends Model {

    @JsonProperty("audiences")
    List<String> audiences;
    @JsonProperty("baseUri")
    String baseUri;
    @JsonProperty("clientId")
    String clientId;
    @JsonProperty("clientName")
    String clientName;
    @JsonProperty("clientPermissions")
    List<AccountcommonPermissionV3> clientPermissions;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("modifiedAt")
    String modifiedAt;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("oauthClientType")
    String oauthClientType;
    @JsonProperty("redirectUri")
    String redirectUri;
    @JsonProperty("scopes")
    List<String> scopes;

    public ClientmodelClientV3Response createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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