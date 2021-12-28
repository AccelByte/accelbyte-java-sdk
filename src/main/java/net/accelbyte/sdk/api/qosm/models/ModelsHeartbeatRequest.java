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
public class ModelsHeartbeatRequest extends Model {

    @JsonProperty("ip")
    private String ip;

    @JsonProperty("port")
    private Integer port;

    @JsonProperty("region")
    private String region;

    public ModelsHeartbeatRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsHeartbeatRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsHeartbeatRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ip", "ip");
        result.put("port", "port");
        result.put("region", "region");
        return result;
    }
}