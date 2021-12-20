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
public class ClientmodelClientCreateRequest extends Model {

    @JsonProperty("ClientId")
    String clientId;
    @JsonProperty("ClientName")
    String clientName;
    @JsonProperty("ClientPermissions")
    List<AccountcommonPermission> clientPermissions;
    @JsonProperty("Namespace")
    String namespace;
    @JsonProperty("RedirectUri")
    String redirectUri;
    @JsonProperty("Secret")
    String secret;

    public ClientmodelClientCreateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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