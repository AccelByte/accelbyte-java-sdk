/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class AppUpdate extends Model {

  @JsonProperty("carousel")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Slide> carousel;

  @JsonProperty("developer")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String developer;

  @JsonProperty("forumUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String forumUrl;

  @JsonProperty("genres")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> genres;

  @JsonProperty("localizations")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, AppLocalization> localizations;

  @JsonProperty("platformRequirements")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, List<Requirement>> platformRequirements;

  @JsonProperty("platforms")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> platforms;

  @JsonProperty("players")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> players;

  @JsonProperty("primaryGenre")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String primaryGenre;

  @JsonProperty("publisher")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String publisher;

  @JsonProperty("releaseDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String releaseDate;

  @JsonProperty("websiteUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String websiteUrl;

  @JsonIgnore
  public List<String> getGenres() {
    return this.genres;
  }

  @JsonIgnore
  public List<Genres> getGenresAsEnum() {
    ArrayList<Genres> en = new ArrayList<Genres>();
    for (String e : this.genres) en.add(Genres.valueOf(e));
    return en;
  }

  @JsonIgnore
  public void setGenres(final List<String> genres) {
    this.genres = genres;
  }

  @JsonIgnore
  public void setGenresFromEnum(final List<Genres> genres) {
    ArrayList<String> en = new ArrayList<String>();
    for (Genres e : genres) en.add(e.toString());
    this.genres = en;
  }

  @JsonIgnore
  public List<String> getPlatforms() {
    return this.platforms;
  }

  @JsonIgnore
  public List<Platforms> getPlatformsAsEnum() {
    ArrayList<Platforms> en = new ArrayList<Platforms>();
    for (String e : this.platforms) en.add(Platforms.valueOf(e));
    return en;
  }

  @JsonIgnore
  public void setPlatforms(final List<String> platforms) {
    this.platforms = platforms;
  }

  @JsonIgnore
  public void setPlatformsFromEnum(final List<Platforms> platforms) {
    ArrayList<String> en = new ArrayList<String>();
    for (Platforms e : platforms) en.add(e.toString());
    this.platforms = en;
  }

  @JsonIgnore
  public List<String> getPlayers() {
    return this.players;
  }

  @JsonIgnore
  public List<Players> getPlayersAsEnum() {
    ArrayList<Players> en = new ArrayList<Players>();
    for (String e : this.players) en.add(Players.valueOf(e));
    return en;
  }

  @JsonIgnore
  public void setPlayers(final List<String> players) {
    this.players = players;
  }

  @JsonIgnore
  public void setPlayersFromEnum(final List<Players> players) {
    ArrayList<String> en = new ArrayList<String>();
    for (Players e : players) en.add(e.toString());
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
  public AppUpdate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AppUpdate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<AppUpdate>>() {});
  }

  public enum Genres {
    Action("Action"),
    Adventure("Adventure"),
    Casual("Casual"),
    FreeToPlay("FreeToPlay"),
    Indie("Indie"),
    MassivelyMultiplayer("MassivelyMultiplayer"),
    RPG("RPG"),
    Racing("Racing"),
    Simulation("Simulation"),
    Sports("Sports"),
    Strategy("Strategy");

    private String value;

    Genres(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Platforms {
    Android("Android"),
    IOS("IOS"),
    Linux("Linux"),
    MacOS("MacOS"),
    Windows("Windows");

    private String value;

    Platforms(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Players {
    Coop("Coop"),
    CrossPlatformMulti("CrossPlatformMulti"),
    LocalCoop("LocalCoop"),
    MMO("MMO"),
    Multi("Multi"),
    Single("Single");

    private String value;

    Players(String value) {
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
    RPG("RPG"),
    Racing("Racing"),
    Simulation("Simulation"),
    Sports("Sports"),
    Strategy("Strategy");

    private String value;

    PrimaryGenre(String value) {
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
      for (Genres e : genres) en.add(e.toString());
      this.genres = en;
      return this;
    }

    public AppUpdateBuilder platforms(final List<String> platforms) {
      this.platforms = platforms;
      return this;
    }

    public AppUpdateBuilder platformsFromEnum(final List<Platforms> platforms) {
      ArrayList<String> en = new ArrayList<String>();
      for (Platforms e : platforms) en.add(e.toString());
      this.platforms = en;
      return this;
    }

    public AppUpdateBuilder players(final List<String> players) {
      this.players = players;
      return this;
    }

    public AppUpdateBuilder playersFromEnum(final List<Players> players) {
      ArrayList<String> en = new ArrayList<String>();
      for (Players e : players) en.add(e.toString());
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
