package net.accelbyte.sdk.api.social.models;

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
public class SlotInfo extends Model {

    @JsonProperty("checksum")
    String checksum;
    @JsonProperty("customAttribute")
    String customAttribute;
    @JsonProperty("dateAccessed")
    String dateAccessed;
    @JsonProperty("dateCreated")
    String dateCreated;
    @JsonProperty("dateModified")
    String dateModified;
    @JsonProperty("label")
    String label;
    @JsonProperty("mimeType")
    String mimeType;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("originalName")
    String originalName;
    @JsonProperty("size")
    Integer size;
    @JsonProperty("slotId")
    String slotId;
    @JsonProperty("storedName")
    String storedName;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("userId")
    String userId;

    public SlotInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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