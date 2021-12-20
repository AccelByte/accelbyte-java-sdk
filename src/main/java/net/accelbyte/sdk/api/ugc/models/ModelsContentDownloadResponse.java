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
public class ModelsContentDownloadResponse extends Model {

    @JsonProperty("channelId")
    String channelId;
    @JsonProperty("createdTime")
    String createdTime;
    @JsonProperty("creatorFollowState")
    ModelsCreatorFollowState creatorFollowState;
    @JsonProperty("creatorName")
    String creatorName;
    @JsonProperty("downloadCount")
    Integer downloadCount;
    @JsonProperty("fileExtension")
    String fileExtension;
    @JsonProperty("groups")
    List<String> groups;
    @JsonProperty("id")
    String id;
    @JsonProperty("isHidden")
    Boolean isHidden;
    @JsonProperty("isOfficial")
    Boolean isOfficial;
    @JsonProperty("likeCount")
    Integer likeCount;
    @JsonProperty("likeState")
    ModelsLikeState likeState;
    @JsonProperty("name")
    String name;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("payload")
    String payload;
    @JsonProperty("payloadURL")
    List<ModelsPayloadURL> payloadURL;
    @JsonProperty("screenshots")
    List<ModelsScreenshotResponse> screenshots;
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

    public ModelsContentDownloadResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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