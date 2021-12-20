package net.accelbyte.sdk.api.ugc.models;

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
public class ModelsCreateContentResponse extends Model {

    @JsonProperty("channelId")
    String channelId;
    @JsonProperty("contentType")
    String contentType;
    @JsonProperty("createdTime")
    String createdTime;
    @JsonProperty("creatorName")
    String creatorName;
    @JsonProperty("fileExtension")
    String fileExtension;
    @JsonProperty("id")
    String id;
    @JsonProperty("isHidden")
    Boolean isHidden;
    @JsonProperty("isOfficial")
    Boolean isOfficial;
    @JsonProperty("name")
    String name;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("payloadURL")
    List<ModelsPayloadURL> payloadURL;
    @JsonProperty("preview")
    String preview;
    @JsonProperty("shareCode")
    String shareCode;
    @JsonProperty("subType")
    String subType;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("type")
    String type;
    @JsonProperty("userId")
    String userId;

    public ModelsCreateContentResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("channelId", "channelId");
        result.put("contentType", "contentType");
        result.put("createdTime", "createdTime");
        result.put("creatorName", "creatorName");
        result.put("fileExtension", "fileExtension");
        result.put("id", "id");
        result.put("isHidden", "isHidden");
        result.put("isOfficial", "isOfficial");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("payloadURL", "payloadURL");
        result.put("preview", "preview");
        result.put("shareCode", "shareCode");
        result.put("subType", "subType");
        result.put("tags", "tags");
        result.put("type", "type");
        result.put("userId", "userId");
        return result;
    }
}