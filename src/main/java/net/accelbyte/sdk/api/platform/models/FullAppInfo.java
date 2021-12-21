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
public class FullAppInfo extends Model {

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
    @JsonProperty("localizations")
    Map<String, AppLocalization> localizations;
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
    @JsonProperty("releaseDate")
    String releaseDate;
    @JsonProperty("websiteUrl")
    String websiteUrl;

    public FullAppInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("carousel", "carousel");
        result.put("developer", "developer");
        result.put("forumUrl", "forumUrl");
        result.put("genres", "genres");
        result.put("itemId", "itemId");
        result.put("localizations", "localizations");
        result.put("namespace", "namespace");
        result.put("platformRequirements", "platformRequirements");
        result.put("platforms", "platforms");
        result.put("players", "players");
        result.put("primaryGenre", "primaryGenre");
        result.put("publisher", "publisher");
        result.put("releaseDate", "releaseDate");
        result.put("websiteUrl", "websiteUrl");
        return result;
    }
}