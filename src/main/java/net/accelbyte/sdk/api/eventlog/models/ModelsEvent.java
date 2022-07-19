/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsEvent extends Model {

  @JsonProperty("AgentType")
  private Integer agentType;

  @JsonProperty("ClientID")
  private String clientID;

  @JsonProperty("ComponentID")
  private Integer componentID;

  @JsonProperty("EventID")
  private Integer eventID;

  @JsonProperty("EventLevel")
  private Integer eventLevel;

  @JsonProperty("EventType")
  private Integer eventType;

  @JsonProperty("IPAddress")
  private String ipAddress;

  @JsonProperty("Namespace")
  private String namespace;

  @JsonProperty("Realm")
  private String realm;

  @JsonProperty("TargetNamespace")
  private String targetNamespace;

  @JsonProperty("TargetUserID")
  private String targetUserID;

  @JsonProperty("Time")
  private String time;

  @JsonProperty("UX")
  private Integer ux;

  @JsonProperty("UserID")
  private String userID;

  @JsonIgnore
  public ModelsEvent createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsEvent> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsEvent>>() {});
  }
}
