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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelLinkRequest extends Model {

  @JsonProperty("client_id")
  private String clientId;

  @JsonProperty("conflict_publisher_user_id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String conflictPublisherUserId;

  @JsonProperty("conflict_user_linked_games")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> conflictUserLinkedGames;

  @JsonProperty("current_user_linked_games")
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

  @JsonProperty("operation_name")
  private String operationName;

  @JsonProperty("payload")
  private Map<String, ?> payload;

  @JsonProperty("platformDisplayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformDisplayName;

  @JsonProperty("platformID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformID;

  @JsonProperty("platform_user_id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformUserId;

  @JsonProperty("redirect_uri")
  private String redirectUri;

  @JsonProperty("refreshToken")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String refreshToken;

  @JsonProperty("request_id")
  private String requestId;

  @JsonProperty("status")
  private String status;

  @JsonIgnore
  public ModelLinkRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelLinkRequest> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelLinkRequest>>() {});
  }
}
