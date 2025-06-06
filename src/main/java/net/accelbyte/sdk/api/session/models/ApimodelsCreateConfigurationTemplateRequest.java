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
public class ApimodelsCreateConfigurationTemplateRequest extends Model {

  @JsonProperty("NativeSessionSetting")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsNativeSessionSetting nativeSessionSetting;

  @JsonProperty("PSNBaseUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String psnBaseUrl;

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
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoJoin;

  @JsonProperty("autoLeaveSession")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoLeaveSession;

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

  @JsonProperty("maxActiveSessions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxActiveSessions;

  @JsonProperty("maxPlayers")
  private Integer maxPlayers;

  @JsonProperty("minPlayers")
  private Integer minPlayers;

  @JsonProperty("name")
  private String name;

  @JsonProperty("persistent")
  private Boolean persistent;

  @JsonProperty("preferredClaimKeys")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> preferredClaimKeys;

  @JsonProperty("requestedRegions")
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
  public ApimodelsCreateConfigurationTemplateRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsCreateConfigurationTemplateRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsCreateConfigurationTemplateRequest>>() {});
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

  public static class ApimodelsCreateConfigurationTemplateRequestBuilder {
    private String textChatMode;

    public ApimodelsCreateConfigurationTemplateRequestBuilder textChatMode(
        final String textChatMode) {
      this.textChatMode = textChatMode;
      return this;
    }

    public ApimodelsCreateConfigurationTemplateRequestBuilder textChatModeFromEnum(
        final TextChatMode textChatMode) {
      this.textChatMode = textChatMode.toString();
      return this;
    }
  }
}
