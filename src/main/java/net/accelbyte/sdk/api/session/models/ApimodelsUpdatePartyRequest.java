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
public class ApimodelsUpdatePartyRequest extends Model {

  @JsonProperty("attributes")
  private Map<String, ?> attributes;

  @JsonProperty("inactiveTimeout")
  private Integer inactiveTimeout;

  @JsonProperty("inviteTimeout")
  private Integer inviteTimeout;

  @JsonProperty("joinability")
  private String joinability;

  @JsonProperty("maxPlayers")
  private Integer maxPlayers;

  @JsonProperty("minPlayers")
  private Integer minPlayers;

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
  public ApimodelsUpdatePartyRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsUpdatePartyRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsUpdatePartyRequest>>() {});
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

  public static class ApimodelsUpdatePartyRequestBuilder {
    private String joinability;
    private String type;

    public ApimodelsUpdatePartyRequestBuilder joinability(final String joinability) {
      this.joinability = joinability;
      return this;
    }

    public ApimodelsUpdatePartyRequestBuilder joinabilityFromEnum(final Joinability joinability) {
      this.joinability = joinability.toString();
      return this;
    }

    public ApimodelsUpdatePartyRequestBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public ApimodelsUpdatePartyRequestBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
