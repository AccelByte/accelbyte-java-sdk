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
public class ClientmodelClientCreateRequest extends Model {

    @JsonProperty("ClientId")
    private String clientId;

    @JsonProperty("ClientName")
    private String clientName;

    @JsonProperty("ClientPermissions")
    private List<AccountcommonPermission> clientPermissions;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("RedirectUri")
    private String redirectUri;

    @JsonProperty("Secret")
    private String secret;

    @JsonIgnore
    public ClientmodelClientCreateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ClientmodelClientCreateRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ClientmodelClientCreateRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ClientId", "clientId");
        result.put("ClientName", "clientName");
        result.put("ClientPermissions", "clientPermissions");
        result.put("Namespace", "namespace");
        result.put("RedirectUri", "redirectUri");
        result.put("Secret", "secret");
        return result;
    }
}