package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsUpdateDSMConfigRequest extends Model {

    @JsonProperty("claim_timeout")
    Integer claimTimeout;
    @JsonProperty("creation_timeout")
    Integer creationTimeout;
    @JsonProperty("default_version")
    String defaultVersion;
    @JsonProperty("port")
    Integer port;
    @JsonProperty("protocol")
    String protocol;
    @JsonProperty("providers")
    List<String> providers;
    @JsonProperty("session_timeout")
    Integer sessionTimeout;
    @JsonProperty("unreachable_timeout")
    Integer unreachableTimeout;

    public ModelsUpdateDSMConfigRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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