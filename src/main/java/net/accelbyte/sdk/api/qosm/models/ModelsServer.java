package net.accelbyte.sdk.api.qosm.models;

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
public class ModelsServer extends Model {

    @JsonProperty("alias")
    private String alias;

    @JsonProperty("ip")
    private String ip;

    @JsonProperty("last_update")
    private String lastUpdate;

    @JsonProperty("port")
    private Integer port;

    @JsonProperty("region")
    private String region;

    @JsonProperty("status")
    private String status;

    public ModelsServer createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsServer> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsServer>>() {});
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