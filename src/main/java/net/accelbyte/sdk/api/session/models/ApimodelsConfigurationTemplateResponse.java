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
public class ApimodelsConfigurationTemplateResponse extends Model {

  @JsonProperty("PSNBaseUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String psnBaseUrl;

  @JsonProperty("autoJoin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoJoin;

  @JsonProperty("clientVersion")
  private String clientVersion;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("disableCodeGeneration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean disableCodeGeneration;

  @JsonProperty("dsManualSetReady")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean dsManualSetReady;

  @JsonProperty("dsSource")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dsSource;

  @JsonProperty("enableSecret")
  private Boolean enableSecret;

  @JsonProperty("fallbackClaimKeys")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> fallbackClaimKeys;

  @JsonProperty("immutableStorage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean immutableStorage;

  @JsonProperty("inactiveTimeout")
  private Integer inactiveTimeout;

  @JsonProperty("inviteTimeout")
  private Integer inviteTimeout;

  @JsonProperty("joinability")
  private String joinability;

  @JsonProperty("last")
  private String last;

  @JsonProperty("maxActiveSessions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxActiveSessions;

  @JsonProperty("maxPlayers")
  private Integer maxPlayers;

  @JsonProperty("minPlayers")
  private Integer minPlayers;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("nativeSessionSetting")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsNativeSessionSetting nativeSessionSetting;

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

  @JsonProperty("tieTeamsSessionLifetime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean tieTeamsSessionLifetime;

  @JsonProperty("type")
  private String type;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public ApimodelsConfigurationTemplateResponse createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsConfigurationTemplateResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsConfigurationTemplateResponse>>() {});
  }
}
