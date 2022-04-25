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


    
    @JsonIgnore
    public List<String> getGenres() {
        return this.genres;
    }
    
    @JsonIgnore
    public List<Genres> getGenresAsEnum() {
        ArrayList<Genres> en = new ArrayList<Genres>();
        for(String e : this.genres) en.add(Genres.valueOf(e));
        return en;
    }
    
    @JsonIgnore
    public void setGenres(final List<String> genres) {
        this.genres = genres;
    }
    
    @JsonIgnore
    public void setGenresFromEnum(final List<Genres> genres) {
        ArrayList<String> en = new ArrayList<String>();
        for(Genres e : genres) en.add(e.toString());
        this.genres = en;
    }
    
    @JsonIgnore
    public List<String> getPlatforms() {
        return this.platforms;
    }
    
    @JsonIgnore
    public List<Platforms> getPlatformsAsEnum() {
        ArrayList<Platforms> en = new ArrayList<Platforms>();
        for(String e : this.platforms) en.add(Platforms.valueOf(e));
        return en;
    }
    
    @JsonIgnore
    public void setPlatforms(final List<String> platforms) {
        this.platforms = platforms;
    }
    
    @JsonIgnore
    public void setPlatformsFromEnum(final List<Platforms> platforms) {
        ArrayList<String> en = new ArrayList<String>();
        for(Platforms e : platforms) en.add(e.toString());
        this.platforms = en;
    }
    
    @JsonIgnore
    public List<String> getPlayers() {
        return this.players;
    }
    
    @JsonIgnore
    public List<Players> getPlayersAsEnum() {
        ArrayList<Players> en = new ArrayList<Players>();
        for(String e : this.players) en.add(Players.valueOf(e));
        return en;
    }
    
    @JsonIgnore
    public void setPlayers(final List<String> players) {
        this.players = players;
    }
    
    @JsonIgnore
    public void setPlayersFromEnum(final List<Players> players) {
        ArrayList<String> en = new ArrayList<String>();
        for(Players e : players) en.add(e.toString());
        this.players = en;
    }
    
    @JsonIgnore
    public String getPrimaryGenre() {
        return this.primaryGenre;
    }
    
    @JsonIgnore
    public PrimaryGenre getPrimaryGenreAsEnum() {
        return PrimaryGenre.valueOf(this.primaryGenre);
    }
    
    @JsonIgnore
    public void setPrimaryGenre(final String primaryGenre) {
        this.primaryGenre = primaryGenre;
    }
    
    @JsonIgnore
    public void setPrimaryGenreFromEnum(final PrimaryGenre primaryGenre) {
        this.primaryGenre = primaryGenre.toString();
    }

    @JsonIgnore
    public AppInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AppInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AppInfo>>() {});
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
    
    public static class AppInfoBuilder {
        private List<String> genres;
        private List<String> platforms;
        private List<String> players;
        private String primaryGenre;
        
        
        public AppInfoBuilder genres(final List<String> genres) {
            this.genres = genres;
            return this;
        }
        
        public AppInfoBuilder genresFromEnum(final List<Genres> genres) {
            ArrayList<String> en = new ArrayList<String>();
            for(Genres e : genres) en.add(e.toString());
            this.genres = en;
            return this;
        }
        
        public AppInfoBuilder platforms(final List<String> platforms) {
            this.platforms = platforms;
            return this;
        }
        
        public AppInfoBuilder platformsFromEnum(final List<Platforms> platforms) {
            ArrayList<String> en = new ArrayList<String>();
            for(Platforms e : platforms) en.add(e.toString());
            this.platforms = en;
            return this;
        }
        
        public AppInfoBuilder players(final List<String> players) {
            this.players = players;
            return this;
        }
        
        public AppInfoBuilder playersFromEnum(final List<Players> players) {
            ArrayList<String> en = new ArrayList<String>();
            for(Players e : players) en.add(e.toString());
            this.players = en;
            return this;
        }
        
        public AppInfoBuilder primaryGenre(final String primaryGenre) {
            this.primaryGenre = primaryGenre;
            return this;
        }
        
        public AppInfoBuilder primaryGenreFromEnum(final PrimaryGenre primaryGenre) {
            this.primaryGenre = primaryGenre.toString();
            return this;
        }
    }
}