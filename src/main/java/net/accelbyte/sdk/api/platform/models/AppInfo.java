package net.accelbyte.sdk.api.platform.models;

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
public class AppInfo extends Model {

    @JsonProperty("announcement")
    String announcement;
    @JsonProperty("carousel")
    List<Slide> carousel;
    @JsonProperty("developer")
    String developer;
    @JsonProperty("forumUrl")
    String forumUrl;
    @JsonProperty("genres")
    List<String> genres;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("language")
    String language;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("platformRequirements")
    Map<String, List<Requirement>> platformRequirements;
    @JsonProperty("platforms")
    List<String> platforms;
    @JsonProperty("players")
    List<String> players;
    @JsonProperty("primaryGenre")
    String primaryGenre;
    @JsonProperty("publisher")
    String publisher;
    @JsonProperty("region")
    String region;
    @JsonProperty("releaseDate")
    String releaseDate;
    @JsonProperty("slogan")
    String slogan;
    @JsonProperty("websiteUrl")
    String websiteUrl;

    public AppInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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