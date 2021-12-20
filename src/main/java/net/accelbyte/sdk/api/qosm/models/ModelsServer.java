package net.accelbyte.sdk.api.qosm.models;

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
public class ModelsServer extends Model {

    @JsonProperty("alias")
    String alias;
    @JsonProperty("ip")
    String ip;
    @JsonProperty("last_update")
    String lastUpdate;
    @JsonProperty("port")
    Integer port;
    @JsonProperty("region")
    String region;
    @JsonProperty("status")
    String status;

    public ModelsServer createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("alias", "alias");
        result.put("ip", "ip");
        result.put("last_update", "lastUpdate");
        result.put("port", "port");
        result.put("region", "region");
        result.put("status", "status");
        return result;
    }
}