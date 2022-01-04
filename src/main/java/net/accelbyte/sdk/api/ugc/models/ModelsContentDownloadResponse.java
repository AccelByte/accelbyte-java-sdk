package net.accelbyte.sdk.api.ugc.models;

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
public class ModelsContentDownloadResponse extends Model {

    @JsonProperty("channelId")
    private String channelId;

    @JsonProperty("createdTime")
    private String createdTime;

    @JsonProperty("creatorFollowState")
    private ModelsCreatorFollowState creatorFollowState;

    @JsonProperty("creatorName")
    private String creatorName;

    @JsonProperty("downloadCount")
    private Integer downloadCount;

    @JsonProperty("fileExtension")
    private String fileExtension;

    @JsonProperty("groups")
    private List<String> groups;

    @JsonProperty("id")
    private String id;

    @JsonProperty("isHidden")
    private Boolean isHidden;

    @JsonProperty("isOfficial")
    private Boolean isOfficial;

    @JsonProperty("likeCount")
    private Integer likeCount;

    @JsonProperty("likeState")
    private ModelsLikeState likeState;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("payload")
    private String payload;

    @JsonProperty("payloadURL")
    private List<ModelsPayloadURL> payloadURL;

    @JsonProperty("screenshots")
    private List<ModelsScreenshotResponse> screenshots;

    @JsonProperty("shareCode")
    private String shareCode;

    @JsonProperty("subType")
    private String subType;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("type")
    private String type;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public ModelsContentDownloadResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsContentDownloadResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsContentDownloadResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("channelId", "channelId");
        result.put("createdTime", "createdTime");
        result.put("creatorFollowState", "creatorFollowState");
        result.put("creatorName", "creatorName");
        result.put("downloadCount", "downloadCount");
        result.put("fileExtension", "fileExtension");
        result.put("groups", "groups");
        result.put("id", "id");
        result.put("isHidden", "isHidden");
        result.put("isOfficial", "isOfficial");
        result.put("likeCount", "likeCount");
        result.put("likeState", "likeState");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("payload", "payload");
        result.put("payloadURL", "payloadURL");
        result.put("screenshots", "screenshots");
        result.put("shareCode", "shareCode");
        result.put("subType", "subType");
        result.put("tags", "tags");
        result.put("type", "type");
        result.put("userId", "userId");
        return result;
    }
}