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
public class ModelThirdPartyLoginPlatformCredentialResponse extends Model {

    @JsonProperty("ACSURL")
    private String acsurl;

    @JsonProperty("AWSCognitoRegion")
    private String awsCognitoRegion;

    @JsonProperty("AWSCognitoUserPool")
    private String awsCognitoUserPool;

    @JsonProperty("AppId")
    private String appId;

    @JsonProperty("ClientId")
    private String clientId;

    @JsonProperty("Environment")
    private String environment;

    @JsonProperty("FederationMetadataURL")
    private String federationMetadataURL;

    @JsonProperty("IsActive")
    private Boolean isActive;

    @JsonProperty("KeyID")
    private String keyID;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("OrganizationId")
    private String organizationId;

    @JsonProperty("PlatformId")
    private String platformId;

    @JsonProperty("RedirectUri")
    private String redirectUri;

    @JsonProperty("Secret")
    private String secret;

    @JsonProperty("TeamID")
    private String teamID;

    public ModelThirdPartyLoginPlatformCredentialResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelThirdPartyLoginPlatformCredentialResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelThirdPartyLoginPlatformCredentialResponse>>() {});
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
        result.put("Namespace", "namespace");
        result.put("OrganizationId", "organizationId");
        result.put("PlatformId", "platformId");
        result.put("RedirectUri", "redirectUri");
        result.put("Secret", "secret");
        result.put("TeamID", "teamID");
        return result;
    }
}