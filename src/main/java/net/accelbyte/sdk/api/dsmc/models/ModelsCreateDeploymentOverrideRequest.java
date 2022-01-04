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
public class ModelsCreateDeploymentOverrideRequest extends Model {

    @JsonProperty("buffer_count")
    private Integer bufferCount;

    @JsonProperty("buffer_percent")
    private Integer bufferPercent;

    @JsonProperty("configuration")
    private String configuration;

    @JsonProperty("enable_region_overrides")
    private Boolean enableRegionOverrides;

    @JsonProperty("game_version")
    private String gameVersion;

    @JsonProperty("max_count")
    private Integer maxCount;

    @JsonProperty("min_count")
    private Integer minCount;

    @JsonProperty("region_overrides")
    private Map<String, ModelsPodCountConfigOverride> regionOverrides;

    @JsonProperty("regions")
    private List<String> regions;

    @JsonProperty("use_buffer_percent")
    private Boolean useBufferPercent;

    @JsonIgnore
    public ModelsCreateDeploymentOverrideRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsCreateDeploymentOverrideRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCreateDeploymentOverrideRequest>>() {});
    }

    @JsonIgnore
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