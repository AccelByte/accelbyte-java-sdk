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
public class AppInfo extends Model {

    @JsonProperty("announcement")
    private String announcement;

    @JsonProperty("carousel")
    private List<Slide> carousel;

    @JsonProperty("developer")
    private String developer;

    @JsonProperty("forumUrl")
    private String forumUrl;

    @JsonProperty("genres")
    private List<String> genres;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("language")
    private String language;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("platformRequirements")
    private Map<String, List<Requirement>> platformRequirements;

    @JsonProperty("platforms")
    private List<String> platforms;

    @JsonProperty("players")
    private List<String> players;

    @JsonProperty("primaryGenre")
    private String primaryGenre;

    @JsonProperty("publisher")
    private String publisher;

    @JsonProperty("region")
    private String region;

    @JsonProperty("releaseDate")
    private String releaseDate;

    @JsonProperty("slogan")
    private String slogan;

    @JsonProperty("websiteUrl")
    private String websiteUrl;

    public AppInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<AppInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AppInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("announcement", "announcement");
        result.put("carousel", "carousel");
        result.put("developer", "developer");
        result.put("forumUrl", "forumUrl");
        result.put("genres", "genres");
        result.put("itemId", "itemId");
        result.put("language", "language");
        result.put("namespace", "namespace");
        result.put("platformRequirements", "platformRequirements");
        result.put("platforms", "platforms");
        result.put("players", "players");
        result.put("primaryGenre", "primaryGenre");
        result.put("publisher", "publisher");
        result.put("region", "region");
        result.put("releaseDate", "releaseDate");
        result.put("slogan", "slogan");
        result.put("websiteUrl", "websiteUrl");
        return result;
    }
}