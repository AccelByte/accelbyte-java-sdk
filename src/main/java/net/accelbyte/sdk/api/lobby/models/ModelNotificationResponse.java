/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.models;

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
public class ModelNotificationResponse extends Model {

  @JsonProperty("from")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String from;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("lobbySessionID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String lobbySessionID;

  @JsonProperty("loginType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String loginType;

  @JsonProperty("payload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String payload;

  @JsonProperty("reconnectFromCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer reconnectFromCode;

  @JsonProperty("sentAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sentAt;

  @JsonProperty("sequenceID")
  private Integer sequenceID;

  @JsonProperty("sequenceNumber")
  private Integer sequenceNumber;

  @JsonProperty("to")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String to;

  @JsonProperty("topic")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String topic;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public ModelNotificationResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelNotificationResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelNotificationResponse>>() {});
  }
}
