package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsUpdateDSMConfigRequest extends Model {

    @JsonProperty("claim_timeout")
    private Integer claimTimeout;

    @JsonProperty("creation_timeout")
    private Integer creationTimeout;

    @JsonProperty("default_version")
    private String defaultVersion;

    @JsonProperty("port")
    private Integer port;

    @JsonProperty("protocol")
    private String protocol;

    @JsonProperty("providers")
    private List<String> providers;

    @JsonProperty("session_timeout")
    private Integer sessionTimeout;

    @JsonProperty("unreachable_timeout")
    private Integer unreachableTimeout;

    @JsonIgnore
    public ModelsUpdateDSMConfigRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsUpdateDSMConfigRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUpdateDSMConfigRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("claim_timeout", "claimTimeout");
        result.put("creation_timeout", "creationTimeout");
        result.put("default_version", "defaultVersion");
        result.put("port", "port");
        result.put("protocol", "protocol");
        result.put("providers", "providers");
        result.put("session_timeout", "sessionTimeout");
        result.put("unreachable_timeout", "unreachableTimeout");
        return result;
    }
}