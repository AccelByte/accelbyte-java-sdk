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
public class ApimodelsPublicConfiguration extends Model {

  @JsonProperty("PSNBaseURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String psnBaseURL;

  @JsonProperty("amsClaimTimeoutMinutes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer amsClaimTimeoutMinutes;

  @JsonProperty("appName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appName;

  @JsonProperty("asyncProcessDSRequest")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsAsyncProcessDSRequest asyncProcessDSRequest;

  @JsonProperty("attributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> attributes;

  @JsonProperty("autoJoin")
  private Boolean autoJoin;

  @JsonProperty("clientVersion")
  private String clientVersion;

  @JsonProperty("customURLGRPC")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String customURLGRPC;

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("disableCodeGeneration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean disableCodeGeneration;

  @JsonProperty("disableResendInvite")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean disableResendInvite;

  @JsonProperty("dsManualSetReady")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean dsManualSetReady;

  @JsonProperty("dsSource")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dsSource;

  @JsonProperty("enableSecret")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enableSecret;

  @JsonProperty("fallbackClaimKeys")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> fallbackClaimKeys;

  @JsonProperty("grpcSessionConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsExtendConfiguration grpcSessionConfig;

  @JsonProperty("immutableStorage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean immutableStorage;

  @JsonProperty("inactiveTimeout")
  private Integer inactiveTimeout;

  @JsonProperty("inviteTimeout")
  private Integer inviteTimeout;

  @JsonProperty("joinability")
  private String joinability;

  @JsonProperty("leaderElectionGracePeriod")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer leaderElectionGracePeriod;

  @JsonProperty("manualRejoin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean manualRejoin;

  @JsonProperty("maxActiveSession")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxActiveSession;

  @JsonProperty("maxPlayers")
  private Integer maxPlayers;

  @JsonProperty("minPlayers")
  private Integer minPlayers;

  @JsonProperty("name")
  private String name;

  @JsonProperty("nativeSessionSetting")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsNativeSessionSetting nativeSessionSetting;

  @JsonProperty("partyCodeLength")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer partyCodeLength;

  @JsonProperty("persistent")
  private Boolean persistent;

  @JsonProperty("preferredClaimKeys")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> preferredClaimKeys;

  @JsonProperty("requestedRegions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> requestedRegions;

  @JsonProperty("textChat")
  private Boolean textChat;

  @JsonProperty("textChatMode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String textChatMode;

  @JsonProperty("tieTeamsSessionLifetime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean tieTeamsSessionLifetime;

  @JsonProperty("ttlHours")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer ttlHours;

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
  public ApimodelsPublicConfiguration createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsPublicConfiguration> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsPublicConfiguration>>() {});
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

  public static class ApimodelsPublicConfigurationBuilder {
    private String joinability;
    private String textChatMode;
    private String type;

    public ApimodelsPublicConfigurationBuilder joinability(final String joinability) {
      this.joinability = joinability;
      return this;
    }

    public ApimodelsPublicConfigurationBuilder joinabilityFromEnum(final Joinability joinability) {
      this.joinability = joinability.toString();
      return this;
    }

    public ApimodelsPublicConfigurationBuilder textChatMode(final String textChatMode) {
      this.textChatMode = textChatMode;
      return this;
    }

    public ApimodelsPublicConfigurationBuilder textChatModeFromEnum(
        final TextChatMode textChatMode) {
      this.textChatMode = textChatMode.toString();
      return this;
    }

    public ApimodelsPublicConfigurationBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public ApimodelsPublicConfigurationBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
