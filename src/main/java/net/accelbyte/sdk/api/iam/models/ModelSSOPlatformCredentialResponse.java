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
public class ModelSSOPlatformCredentialResponse extends Model {

    @JsonProperty("acsUrl")
    String acsUrl;
    @JsonProperty("appId")
    String appId;
    @JsonProperty("federationMetadataUrl")
    String federationMetadataUrl;
    @JsonProperty("isActive")
    Boolean isActive;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("platformId")
    String platformId;
    @JsonProperty("redirectUri")
    String redirectUri;
    @JsonProperty("secret")
    String secret;
    @JsonProperty("ssoUrl")
    String ssoUrl;
    @JsonProperty("truncatedApiKey")
    String truncatedApiKey;

    public ModelSSOPlatformCredentialResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("acsUrl", "acsUrl");
        result.put("appId", "appId");
        result.put("federationMetadataUrl", "federationMetadataUrl");
        result.put("isActive", "isActive");
        result.put("namespace", "namespace");
        result.put("platformId", "platformId");
        result.put("redirectUri", "redirectUri");
        result.put("secret", "secret");
        result.put("ssoUrl", "ssoUrl");
        result.put("truncatedApiKey", "truncatedApiKey");
        return result;
    }
}