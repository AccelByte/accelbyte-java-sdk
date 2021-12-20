package net.accelbyte.sdk.api.seasonpass.models;

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
public class LocalizedSeasonInfo extends Model {

    @JsonProperty("title")
    String title;
    @JsonProperty("description")
    String description;
    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("name")
    String name;
    @JsonProperty("start")
    String start;
    @JsonProperty("end")
    String end;
    @JsonProperty("tierItemId")
    String tierItemId;
    @JsonProperty("autoClaim")
    Boolean autoClaim;
    @JsonProperty("images")
    List<Image> images;
    @JsonProperty("passCodes")
    List<String> passCodes;
    @JsonProperty("status")
    String status;
    @JsonProperty("publishedAt")
    String publishedAt;
    @JsonProperty("language")
    String language;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("passes")
    List<LocalizedPassInfo> passes;
    @JsonProperty("rewards")
    Map<String, RewardInfo> rewards;
    @JsonProperty("tiers")
    List<Tier> tiers;

    public LocalizedSeasonInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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