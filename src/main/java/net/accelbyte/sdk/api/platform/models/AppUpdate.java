/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AppUpdate extends Model {

    @JsonProperty("carousel")
    private List<Slide> carousel;

    @JsonProperty("developer")
    private String developer;

    @JsonProperty("forumUrl")
    private String forumUrl;

    @JsonProperty("genres")
    private List<String> genres;

    @JsonProperty("localizations")
    private Map<String, AppLocalization> localizations;

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

    @JsonProperty("releaseDate")
    private String releaseDate;

    @JsonProperty("websiteUrl")
    private String websiteUrl;


    
    public List<String> getGenres() {
        return this.genres;
    }
    
    public List<Genres> getGenresAsEnum() {
        ArrayList<Genres> en = new ArrayList<Genres>();
        for(String e : this.genres) en.add(Genres.valueOf(e));
        return en;
    }
    
    public void setGenres(final List<String> genres) {
        this.genres = genres;
    }
    
    public void setGenresFromEnum(final List<Genres> genres) {
        ArrayList<String> en = new ArrayList<String>();
        for(Genres e : genres) en.add(e.toString());
        this.genres = en;
    }
    
    public List<String> getPlatforms() {
        return this.platforms;
    }
    
    public List<Platforms> getPlatformsAsEnum() {
        ArrayList<Platforms> en = new ArrayList<Platforms>();
        for(String e : this.platforms) en.add(Platforms.valueOf(e));
        return en;
    }
    
    public void setPlatforms(final List<String> platforms) {
        this.platforms = platforms;
    }
    
    public void setPlatformsFromEnum(final List<Platforms> platforms) {
        ArrayList<String> en = new ArrayList<String>();
        for(Platforms e : platforms) en.add(e.toString());
        this.platforms = en;
    }
    
    public List<String> getPlayers() {
        return this.players;
    }
    
    public List<Players> getPlayersAsEnum() {
        ArrayList<Players> en = new ArrayList<Players>();
        for(String e : this.players) en.add(Players.valueOf(e));
        return en;
    }
    
    public void setPlayers(final List<String> players) {
        this.players = players;
    }
    
    public void setPlayersFromEnum(final List<Players> players) {
        ArrayList<String> en = new ArrayList<String>();
        for(Players e : players) en.add(e.toString());
        this.players = en;
    }
    
    public String getPrimaryGenre() {
        return this.primaryGenre;
    }
    
    public PrimaryGenre getPrimaryGenreAsEnum() {
        return PrimaryGenre.valueOf(this.primaryGenre);
    }
    
    public void setPrimaryGenre(final String primaryGenre) {
        this.primaryGenre = primaryGenre;
    }
    
    public void setPrimaryGenreFromEnum(final PrimaryGenre primaryGenre) {
        this.primaryGenre = primaryGenre.toString();
    }

    @JsonIgnore
    public AppUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AppUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AppUpdate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("carousel", "carousel");
        result.put("developer", "developer");
        result.put("forumUrl", "forumUrl");
        result.put("genres", "genres");
        result.put("localizations", "localizations");
        result.put("platformRequirements", "platformRequirements");
        result.put("platforms", "platforms");
        result.put("players", "players");
        result.put("primaryGenre", "primaryGenre");
        result.put("publisher", "publisher");
        result.put("releaseDate", "releaseDate");
        result.put("websiteUrl", "websiteUrl");
        return result;
    }
    
    public enum Genres {
        Action("Action"),
        Adventure("Adventure"),
        Casual("Casual"),
        FreeToPlay("FreeToPlay"),
        Indie("Indie"),
        MassivelyMultiplayer("MassivelyMultiplayer"),
        Racing("Racing"),
        RPG("RPG"),
        Simulation("Simulation"),
        Sports("Sports"),
        Strategy("Strategy");

        private String value;

        Genres(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Platforms {
        Windows("Windows"),
        MacOS("MacOS"),
        Linux("Linux"),
        IOS("IOS"),
        Android("Android");

        private String value;

        Platforms(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum Players {
        Single("Single"),
        Multi("Multi"),
        CrossPlatformMulti("CrossPlatformMulti"),
        MMO("MMO"),
        Coop("Coop"),
        LocalCoop("LocalCoop");

        private String value;

        Players(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public enum PrimaryGenre {
        Action("Action"),
        Adventure("Adventure"),
        Casual("Casual"),
        FreeToPlay("FreeToPlay"),
        Indie("Indie"),
        MassivelyMultiplayer("MassivelyMultiplayer"),
        Racing("Racing"),
        RPG("RPG"),
        Simulation("Simulation"),
        Sports("Sports"),
        Strategy("Strategy");

        private String value;

        PrimaryGenre(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    public static class AppUpdateBuilder {
        private List<String> genres;
        private List<String> platforms;
        private List<String> players;
        private String primaryGenre;
        
        
        public AppUpdateBuilder genres(final List<String> genres) {
            this.genres = genres;
            return this;
        }
        
        public AppUpdateBuilder genresFromEnum(final List<Genres> genres) {
            ArrayList<String> en = new ArrayList<String>();
            for(Genres e : genres) en.add(e.toString());
            this.genres = en;
            return this;
        }
        
        public AppUpdateBuilder platforms(final List<String> platforms) {
            this.platforms = platforms;
            return this;
        }
        
        public AppUpdateBuilder platformsFromEnum(final List<Platforms> platforms) {
            ArrayList<String> en = new ArrayList<String>();
            for(Platforms e : platforms) en.add(e.toString());
            this.platforms = en;
            return this;
        }
        
        public AppUpdateBuilder players(final List<String> players) {
            this.players = players;
            return this;
        }
        
        public AppUpdateBuilder playersFromEnum(final List<Players> players) {
            ArrayList<String> en = new ArrayList<String>();
            for(Players e : players) en.add(e.toString());
            this.players = en;
            return this;
        }
        
        public AppUpdateBuilder primaryGenre(final String primaryGenre) {
            this.primaryGenre = primaryGenre;
            return this;
        }
        
        public AppUpdateBuilder primaryGenreFromEnum(final PrimaryGenre primaryGenre) {
            this.primaryGenre = primaryGenre.toString();
            return this;
        }
    }
}