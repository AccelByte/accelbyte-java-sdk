package net.accelbyte.sdk.api.seasonpass.models;

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
public class LocalizedSeasonInfo extends Model {

    @JsonProperty("title")
    private String title;

    @JsonProperty("description")
    private String description;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("name")
    private String name;

    @JsonProperty("start")
    private String start;

    @JsonProperty("end")
    private String end;

    @JsonProperty("tierItemId")
    private String tierItemId;

    @JsonProperty("autoClaim")
    private Boolean autoClaim;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("passCodes")
    private List<String> passCodes;

    @JsonProperty("status")
    private String status;

    @JsonProperty("publishedAt")
    private String publishedAt;

    @JsonProperty("language")
    private String language;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("passes")
    private List<LocalizedPassInfo> passes;

    @JsonProperty("rewards")
    private Map<String, RewardInfo> rewards;

    @JsonProperty("tiers")
    private List<Tier> tiers;

    public LocalizedSeasonInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<LocalizedSeasonInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<LocalizedSeasonInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("title", "title");
        result.put("description", "description");
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("name", "name");
        result.put("start", "start");
        result.put("end", "end");
        result.put("tierItemId", "tierItemId");
        result.put("autoClaim", "autoClaim");
        result.put("images", "images");
        result.put("passCodes", "passCodes");
        result.put("status", "status");
        result.put("publishedAt", "publishedAt");
        result.put("language", "language");
        result.put("createdAt", "createdAt");
        result.put("updatedAt", "updatedAt");
        result.put("passes", "passes");
        result.put("rewards", "rewards");
        result.put("tiers", "tiers");
        return result;
    }
}