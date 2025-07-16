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
public class ApimodelsUpdateGameSessionRequest extends Model {

  @JsonProperty("attributes")
  private Map<String, ?> attributes;

  @JsonProperty("backfillTicketID")
  private String backfillTicketID;

  @JsonProperty("clientVersion")
  private String clientVersion;

  @JsonProperty("deployment")
  private String deployment;

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

  @JsonProperty("teams")
  private List<ModelsTeam> teams;

  @JsonProperty("ticketIDs")
  private List<String> ticketIDs;

  @JsonProperty("tieTeamsSessionLifetime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean tieTeamsSessionLifetime;

  @JsonProperty("type")
  private String type;

  @JsonProperty("version")
  private Integer version;

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
  public ApimodelsUpdateGameSessionRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsUpdateGameSessionRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsUpdateGameSessionRequest>>() {});
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

  public static class ApimodelsUpdateGameSessionRequestBuilder {
    private String joinability;
    private String type;

    public ApimodelsUpdateGameSessionRequestBuilder joinability(final String joinability) {
      this.joinability = joinability;
      return this;
    }

    public ApimodelsUpdateGameSessionRequestBuilder joinabilityFromEnum(
        final Joinability joinability) {
      this.joinability = joinability.toString();
      return this;
    }

    public ApimodelsUpdateGameSessionRequestBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public ApimodelsUpdateGameSessionRequestBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
