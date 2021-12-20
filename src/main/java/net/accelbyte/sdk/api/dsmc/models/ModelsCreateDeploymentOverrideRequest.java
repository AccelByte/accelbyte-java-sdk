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
public class ModelsCreateDeploymentOverrideRequest extends Model {

    @JsonProperty("buffer_count")
    Integer bufferCount;
    @JsonProperty("buffer_percent")
    Integer bufferPercent;
    @JsonProperty("configuration")
    String configuration;
    @JsonProperty("enable_region_overrides")
    Boolean enableRegionOverrides;
    @JsonProperty("game_version")
    String gameVersion;
    @JsonProperty("max_count")
    Integer maxCount;
    @JsonProperty("min_count")
    Integer minCount;
    @JsonProperty("region_overrides")
    Map<String, ModelsPodCountConfigOverride> regionOverrides;
    @JsonProperty("regions")
    List<String> regions;
    @JsonProperty("use_buffer_percent")
    Boolean useBufferPercent;

    public ModelsCreateDeploymentOverrideRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("buffer_count", "bufferCount");
        result.put("buffer_percent", "bufferPercent");
        result.put("configuration", "configuration");
        result.put("enable_region_overrides", "enableRegionOverrides");
        result.put("game_version", "gameVersion");
        result.put("max_count", "maxCount");
        result.put("min_count", "minCount");
        result.put("region_overrides", "regionOverrides");
        result.put("regions", "regions");
        result.put("use_buffer_percent", "useBufferPercent");
        return result;
    }
}