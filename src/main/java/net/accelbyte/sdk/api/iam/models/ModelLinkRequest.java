/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.util.Map;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelLinkRequest extends Model {

  @JsonProperty("client_id")
  private String clientId;

  @JsonProperty("conflict_publisher_user_id")
  private String conflictPublisherUserId;

  @JsonProperty("conflict_user_linked_games")
  private List<String> conflictUserLinkedGames;

  @JsonProperty("current_user_linked_games")
  private List<String> currentUserLinkedGames;

  @JsonProperty("error")
  private RestErrorResponse error;

  @JsonProperty("expiration")
  private Integer expiration;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("operation_name")
  private String operationName;

  @JsonProperty("payload")
  private Map<String, ?> payload;

  @JsonProperty("platformDisplayName")
  private String platformDisplayName;

  @JsonProperty("platformID")
  private String platformID;

  @JsonProperty("platform_user_id")
  private String platformUserId;

  @JsonProperty("redirect_uri")
  private String redirectUri;

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
