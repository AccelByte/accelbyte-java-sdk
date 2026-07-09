/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelLinkRequestResponse extends Model {

  @JsonProperty("clientId")
  private String clientId;

  @JsonProperty("conflictPublisherUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String conflictPublisherUserId;

  @JsonProperty("conflictUserLinkedGames")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> conflictUserLinkedGames;

  @JsonProperty("currentUserLinkedGames")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> currentUserLinkedGames;

  @JsonProperty("error")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RestErrorResponseWithConflictedUserPlatformAccounts error;

  @JsonProperty("expiration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer expiration;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("payload")
  private Map<String, ?> payload;

  @JsonProperty("platformDisplayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformDisplayName;

  @JsonProperty("platformId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformId;

  @JsonProperty("platformUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformUserId;

  @JsonProperty("redirectUri")
  private String redirectUri;

  @JsonProperty("requestId")
  private String requestId;

  @JsonProperty("status")
  private String status;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonIgnore
  public ModelLinkRequestResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelLinkRequestResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelLinkRequestResponse>>() {});
  }
}
