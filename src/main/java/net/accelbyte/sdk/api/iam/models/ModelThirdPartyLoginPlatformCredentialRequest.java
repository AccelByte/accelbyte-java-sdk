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
public class ModelThirdPartyLoginPlatformCredentialRequest extends Model {

    @JsonProperty("ACSURL")
    String acsurl;
    @JsonProperty("AWSCognitoRegion")
    String awsCognitoRegion;
    @JsonProperty("AWSCognitoUserPool")
    String awsCognitoUserPool;
    @JsonProperty("AppId")
    String appId;
    @JsonProperty("ClientId")
    String clientId;
    @JsonProperty("Environment")
    String environment;
    @JsonProperty("FederationMetadataURL")
    String federationMetadataURL;
    @JsonProperty("IsActive")
    Boolean isActive;
    @JsonProperty("KeyID")
    String keyID;
    @JsonProperty("OrganizationId")
    String organizationId;
    @JsonProperty("RedirectUri")
    String redirectUri;
    @JsonProperty("Secret")
    String secret;
    @JsonProperty("TeamID")
    String teamID;

    public ModelThirdPartyLoginPlatformCredentialRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ACSURL", "acsurl");
        result.put("AWSCognitoRegion", "awsCognitoRegion");
        result.put("AWSCognitoUserPool", "awsCognitoUserPool");
        result.put("AppId", "appId");
        result.put("ClientId", "clientId");
        result.put("Environment", "environment");
        result.put("FederationMetadataURL", "federationMetadataURL");
        result.put("IsActive", "isActive");
        result.put("KeyID", "keyID");
        result.put("OrganizationId", "organizationId");
        result.put("RedirectUri", "redirectUri");
        result.put("Secret", "secret");
        result.put("TeamID", "teamID");
        return result;
    }
}