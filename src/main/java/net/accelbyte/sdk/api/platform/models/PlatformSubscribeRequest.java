package net.accelbyte.sdk.api.platform.models;

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
public class PlatformSubscribeRequest extends Model {

    @JsonProperty("grantDays")
    private Integer grantDays;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("language")
    private String language;

    @JsonProperty("reason")
    private String reason;

    @JsonProperty("region")
    private String region;

    @JsonProperty("source")
    private String source;

    public PlatformSubscribeRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PlatformSubscribeRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PlatformSubscribeRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("grantDays", "grantDays");
        result.put("itemId", "itemId");
        result.put("language", "language");
        result.put("reason", "reason");
        result.put("region", "region");
        result.put("source", "source");
        return result;
    }
}