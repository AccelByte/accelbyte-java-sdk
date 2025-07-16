/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.models;

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
public class ApimodelsCreateGameSessionRequest extends Model {

  @JsonProperty("appName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appName;

  @JsonProperty("attributes")
  private Map<String, ?> attributes;

  @JsonProperty("autoJoin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoJoin;

  @JsonProperty("backfillTicketID")
  private String backfillTicketID;

  @JsonProperty("clientVersion")
  private String clientVersion;

  @JsonProperty("configurationName")
  private String configurationName;

  @JsonProperty("customURLGRPC")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String customURLGRPC;

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("dsSource")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dsSource;

  @JsonProperty("fallbackClaimKeys")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> fallbackClaimKeys;

  @JsonProperty("inactiveTimeout")
  private Integer inactiveTimeout;

  @JsonProperty("inviteTimeout")
  private Integer inviteTimeout;

  @JsonProperty("joinability")
  private String joinability;

  @JsonProperty("matchPool")
  private String matchPool;

  @JsonProperty("maxPlayers")
  private Integer maxPlayers;

  @JsonProperty("minPlayers")
  private Integer minPlayers;

  @JsonProperty("preferredClaimKeys")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> preferredClaimKeys;

  @JsonProperty("requestedRegions")
  private List<String> requestedRegions;

  @JsonProperty("serverName")
  private String serverName;

  @JsonProperty("storage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelsSessionStorageRequest storage;

  @JsonProperty("teams")
  private List<ModelsTeam> teams;

  @JsonProperty("textChat")
  private Boolean textChat;

  @JsonProperty("textChatMode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String textChatMode;

  @JsonProperty("ticketIDs")
  private List<String> ticketIDs;

  @JsonProperty("tieTeamsSessionLifetime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean tieTeamsSessionLifetime;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public String getJoinability() {
    return this.joinability;
  }

  @JsonIgnore
  public Joinability getJoinabilityAsEnum() {
    return Joinability.valueOf(this.joinability);
  }

  @JsonIgnore
  public void setJoinability(final String joinability) {
    this.joinability = joinability;
  }

  @JsonIgnore
  public void setJoinabilityFromEnum(final Joinability joinability) {
    this.joinability = joinability.toString();
  }

  @JsonIgnore
  public String getTextChatMode() {
    return this.textChatMode;
  }

  @JsonIgnore
  public TextChatMode getTextChatModeAsEnum() {
    return TextChatMode.valueOf(this.textChatMode);
  }

  @JsonIgnore
  public void setTextChatMode(final String textChatMode) {
    this.textChatMode = textChatMode;
  }

  @JsonIgnore
  public void setTextChatModeFromEnum(final TextChatMode textChatMode) {
    this.textChatMode = textChatMode.toString();
  }

  @JsonIgnore
  public String getType() {
    return this.type;
  }

  @JsonIgnore
  public Type getTypeAsEnum() {
    return Type.valueOf(this.type);
  }

  @JsonIgnore
  public void setType(final String type) {
    this.type = type;
  }

  @JsonIgnore
  public void setTypeFromEnum(final Type type) {
    this.type = type.toString();
  }

  @JsonIgnore
  public ApimodelsCreateGameSessionRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsCreateGameSessionRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsCreateGameSessionRequest>>() {});
  }

  public enum Joinability {
    CLOSED("CLOSED"),
    FRIENDSOFFRIENDS("FRIENDS_OF_FRIENDS"),
    FRIENDSOFLEADER("FRIENDS_OF_LEADER"),
    FRIENDSOFMEMBERS("FRIENDS_OF_MEMBERS"),
    INVITEONLY("INVITE_ONLY"),
    OPEN("OPEN");

    private String value;

    Joinability(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum TextChatMode {
    GAME("GAME"),
    NONE("NONE"),
    TEAM("TEAM");

    private String value;

    TextChatMode(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Type {
    DS("DS"),
    NONE("NONE"),
    P2P("P2P");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ApimodelsCreateGameSessionRequestBuilder {
    private String joinability;
    private String textChatMode;
    private String type;

    public ApimodelsCreateGameSessionRequestBuilder joinability(final String joinability) {
      this.joinability = joinability;
      return this;
    }

    public ApimodelsCreateGameSessionRequestBuilder joinabilityFromEnum(
        final Joinability joinability) {
      this.joinability = joinability.toString();
      return this;
    }

    public ApimodelsCreateGameSessionRequestBuilder textChatMode(final String textChatMode) {
      this.textChatMode = textChatMode;
      return this;
    }

    public ApimodelsCreateGameSessionRequestBuilder textChatModeFromEnum(
        final TextChatMode textChatMode) {
      this.textChatMode = textChatMode.toString();
      return this;
    }

    public ApimodelsCreateGameSessionRequestBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public ApimodelsCreateGameSessionRequestBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
