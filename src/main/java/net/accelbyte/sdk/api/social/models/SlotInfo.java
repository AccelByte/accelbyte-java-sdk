package net.accelbyte.sdk.api.social.models;

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
public class SlotInfo extends Model {

    @JsonProperty("checksum")
    private String checksum;

    @JsonProperty("customAttribute")
    private String customAttribute;

    @JsonProperty("dateAccessed")
    private String dateAccessed;

    @JsonProperty("dateCreated")
    private String dateCreated;

    @JsonProperty("dateModified")
    private String dateModified;

    @JsonProperty("label")
    private String label;

    @JsonProperty("mimeType")
    private String mimeType;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("originalName")
    private String originalName;

    @JsonProperty("size")
    private Integer size;

    @JsonProperty("slotId")
    private String slotId;

    @JsonProperty("storedName")
    private String storedName;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("userId")
    private String userId;

    public SlotInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<SlotInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SlotInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("checksum", "checksum");
        result.put("customAttribute", "customAttribute");
        result.put("dateAccessed", "dateAccessed");
        result.put("dateCreated", "dateCreated");
        result.put("dateModified", "dateModified");
        result.put("label", "label");
        result.put("mimeType", "mimeType");
        result.put("namespace", "namespace");
        result.put("originalName", "originalName");
        result.put("size", "size");
        result.put("slotId", "slotId");
        result.put("storedName", "storedName");
        result.put("tags", "tags");
        result.put("userId", "userId");
        return result;
    }
}