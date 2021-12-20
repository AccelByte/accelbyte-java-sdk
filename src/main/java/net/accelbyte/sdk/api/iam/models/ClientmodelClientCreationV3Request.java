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
public class ClientmodelClientCreationV3Request extends Model {

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
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("oauthClientType")
    String oauthClientType;
    @JsonProperty("redirectUri")
    String redirectUri;
    @JsonProperty("secret")
    String secret;

    public ClientmodelClientCreationV3Request createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("audiences", "audiences");
        result.put("baseUri", "baseUri");
        result.put("clientId", "clientId");
        result.put("clientName", "clientName");
        result.put("clientPermissions", "clientPermissions");
        result.put("namespace", "namespace");
        result.put("oauthClientType", "oauthClientType");
        result.put("redirectUri", "redirectUri");
        result.put("secret", "secret");
        return result;
    }
}